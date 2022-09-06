Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251BBECAAD3
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 01:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYTZsmvNKYdZP8Q0CK6eCDtkONM/fcSLx58MNBYKNos=; b=ZuPZRr/VduhY3u
	Blomjrf5XB132sGV+wxk2tOJr422jJux9xRk/9LqMcIB/aZGRTfd07kLyGFkw+v7H8Vov2q0Pk4Ki
	jTmC+CtIc71oI7GdtbT/+EnzjmXkyRsD5yrUk1XnmMvHkEhKFeC0iyiOpFMIuUkJl/RrHHyk3i97l
	/KbVVCMeD4vTX/nlmhsRWPs2Jqhj4zoh7Bamcnvf122ECdaScNsnpgXNU+AwfYrbREdGAtZcW2qcu
	cyxOTViyiF9CCy7BJ/pY8fEK4PEsoqI2aw86w9KkuMYqpzLXlCPHNdMOtRXVpFcWJ0dDyZLYHBZ32
	0x5nuFc6daupgvMqFv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNqn-001Wl1-Ad; Tue, 06 Sep 2022 01:58:05 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNqb-001Wgy-8f
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 01:58:04 +0000
Received: by mail-io1-xd32.google.com with SMTP id r141so7888339iod.4
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=EYmJBnNyOnswLgNST6mnKgMxX73HOt+H1Hff9PW99mI=;
        b=l+C32q5yBAxWIBZ79fWNH0JOMzUE1tW4dqHjizDaLcOHME+YjHgF8C27nUJ/7PNS62
         1nlTJDs93oZAAsbVSbtLR34N8/1v1ZJHCb3FKIVMC9lkW3PQe/rWiTtywAEmG/WoAAFU
         C66De/GVhwPtuBnPQ+mr90QmlwIUF//gozYZsCMRPDmPHk1wGmyQuXUNFBZkdDm4mqqd
         AXv8Yj7qa3AHF5aQYzrminPmveSSxb3y4GC04PT2dwxWe4BKsAvE1z8Ojq2Qhl3HYHJ/
         0V2LhbQF0GUKwkFpfokLwHtepv9E2rLJ+uNAgPqFfASjXx04mxh4kbIrwW/HZLuVvm7U
         aO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EYmJBnNyOnswLgNST6mnKgMxX73HOt+H1Hff9PW99mI=;
        b=3m08XLgOvRYFIEZRy+nExiDt5FW6YAPFDsdEAjPJY8H65XNan+e3/4nuNc9bGZCk1v
         0sj1BeBrNYEf+E2ZQgZp7cJc1uxs+Yz1msYfFrujGNusB1h1acAkg942PXeBezcP7D94
         SAF6xVeZE/lmH/uBHbjacRvJ//GymwH08/bcgK9ybDIg2kajXITZIsy88s0Q11H2Ro62
         FgDukzLSa9FIrl5qmzGu//Yth47bvE0dsL0TNHIp0kxS5gRCqFLHCH7r8dn6C7NvcYCZ
         KIJeZw7RPjma6HamHkKaVE5nnAC+GTXi826q4l0FyGyZByw/DFBdD3pv5a+OvW/rcWzw
         cnKQ==
X-Gm-Message-State: ACgBeo0nshZ/WfaoP3j5si9sK2EDsnu/8BlaDACaHhWEiCdOVkRb6pBD
	2n5JfkKiJr7TOCXMmyr1EK5eA8LXoIm7Lng5Nqk=
X-Google-Smtp-Source: AA6agR5qyGZfiGb98GNwxEhPNkC1kZ/sl1ugbTGIO+9cRRKohMNbJAzJVF1UYJ13KDqSpQ8pMM+JjMyyKESnaA/4EG0=
X-Received: by 2002:a05:6602:1482:b0:688:d06b:223e with SMTP id
 a2-20020a056602148200b00688d06b223emr23898832iow.3.1662429472520; Mon, 05 Sep
 2022 18:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220905083125.29426-1-zong.li@sifive.com> <20220905083125.29426-4-zong.li@sifive.com>
 <cf98f606-a392-37e9-be92-cb854afb4951@microchip.com>
In-Reply-To: <cf98f606-a392-37e9-be92-cb854afb4951@microchip.com>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 6 Sep 2022 09:57:40 +0800
Message-ID: <CA+ZOyaheXVbETyj6YFMn4sb25Feqm9AV0EuuKDbaRXJjAY+_tQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] soc: sifive: ccache: determine the cache level
 from dts
To: Conor.Dooley@microchip.com
Cc: zong.li@sifive.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	greentime.hu@sifive.com, ben.dooks@sifive.com, bp@alien8.de, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_185801_102512_88974E86 
X-CRM114-Status: GOOD (  20.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

PENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPiDmlrwgMjAyMuW5tDnmnIg25pelIOmAseS6jCDl
h4zmmagyOjU25a+r6YGT77yaCj4KPiBPbiAwNS8wOS8yMDIyIDA5OjMxLCBab25nIExpIHdyb3Rl
Ogo+ID4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gPgo+ID4gQ29tcG9zYWJs
ZSBjYWNoZSBjb3VsZCBiZSBMMiBvciBMMyBjYWNoZSwgdXNlICdjYWNoZS1sZXZlbCcgcHJvcGVy
dHkgb2YKPiA+IGRldmljZSBub2RlIHRvIGRldGVybWluZSB0aGUgbGV2ZWwuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfY2NhY2hlLmMgfCA2ICsrKysrLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9jY2FjaGUuYyBiL2RyaXZlcnMvc29jL3NpZml2
ZS9zaWZpdmVfY2NhY2hlLmMKPiA+IGluZGV4IDFiMTZhMTk2NTQ3Zi4uMGUwZWI4NWM5NGQ4IDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9jY2FjaGUuYwo+ID4gKysr
IGIvZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9jY2FjaGUuYwo+ID4gQEAgLTM4LDYgKzM4LDcg
QEAKPiA+ICBzdGF0aWMgdm9pZCBfX2lvbWVtICpjY2FjaGVfYmFzZTsKPiA+ICBzdGF0aWMgaW50
IGdfaXJxW1NJRklWRV9DQ0FDSEVfTUFYX0VDQ0lOVFJdOwo+ID4gIHN0YXRpYyBzdHJ1Y3Qgcmlz
Y3ZfY2FjaGVpbmZvX29wcyBjY2FjaGVfY2FjaGVfb3BzOwo+ID4gK3N0YXRpYyBpbnQgbGV2ZWw7
Cj4KPiBDYW4geW91IGhhdmUgYSBzeXN0ZW0gd2l0aCBhIGNvbXBvc2FibGUgbDIgJiBsMyBjYWNo
ZT8KCldlIGRvbid0IGhhdmUgYSBzeXN0ZW0gd2l0aCBjb21wb3NhYmxlIEwyIGFuZCBMMyBjYWNo
ZSBhdCBzYW1lIHRpbWUuCkJ1dCBhcyBJIG1lbnRpb25lZCBpbiB0aGUgdGhyZWFkIG9mIHNlY29u
ZCBwYXRjaCwgd2UgdXNlIGFub3RoZXIgY2FjaGUKYXMgTDIgd2hlbiB0aGUgY29tcG9zYWJsZSBj
YWNoZSB1c2VkIGZvciBMMy4KCj4KPiA+Cj4gPiAgZW51bSB7Cj4gPiAgICAgICAgIERJUl9DT1JS
ID0gMCwKPiA+IEBAIC0xNDMsNyArMTQ0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1
dGVfZ3JvdXAgcHJpdl9hdHRyX2dyb3VwID0gewo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0
cmlidXRlX2dyb3VwICpjY2FjaGVfZ2V0X3ByaXZfZ3JvdXAoc3RydWN0IGNhY2hlaW5mbyAqdGhp
c19sZWFmKQo+ID4gIHsKPiA+ICAgICAgICAgLyogV2Ugd2FudCB0byB1c2UgcHJpdmF0ZSBncm91
cCBmb3IgY29tcG9zYWJsZSBjYWNoZSBvbmx5ICovCj4gPiAtICAgICAgIGlmICh0aGlzX2xlYWYt
PmxldmVsID09IDIpCj4gPiArICAgICAgIGlmICh0aGlzX2xlYWYtPmxldmVsID09IGxldmVsKQo+
ID4gICAgICAgICAgICAgICAgIHJldHVybiAmcHJpdl9hdHRyX2dyb3VwOwo+ID4gICAgICAgICBl
bHNlCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiBAQCAtMjEwLDYgKzIxMSw5
IEBAIHN0YXRpYyBpbnQgX19pbml0IHNpZml2ZV9jY2FjaGVfaW5pdCh2b2lkKQo+ID4gICAgICAg
ICBpZiAoIWNjYWNoZV9iYXNlKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+
ID4KPiA+ICsgICAgICAgaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAiY2FjaGUtbGV2ZWwi
LCAmbGV2ZWwpKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ID4gKwo+ID4g
ICAgICAgICBpbnRyX251bSA9IG9mX3Byb3BlcnR5X2NvdW50X3UzMl9lbGVtcyhucCwgImludGVy
cnVwdHMiKTsKPiA+ICAgICAgICAgaWYgKCFpbnRyX251bSkgewo+ID4gICAgICAgICAgICAgICAg
IHByX2VycigiQ0NBQ0hFOiBubyBpbnRlcnJ1cHRzIHByb3BlcnR5XG4iKTsKPiA+IC0tCj4gPiAy
LjE3LjEKPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
