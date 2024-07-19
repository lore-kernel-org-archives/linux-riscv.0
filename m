Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB36C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4R9NkarenuYTUif3x6RQaT0H2teHWgBnLYVvHqwYKJI=; b=ZsQCeysQUU/53m
	xHa7xMNQCm9Zue2hddRaoNsT2FxQib30alNYqAk+ITWVX1t7c6PQin9mhH8E8iwlc3jbwREccp2O9
	hjvo0PD0aoZ/egP5wfxvRV+pxurrwsx1xvZuTSWjUivBWQ+6ug/Wau+rQ4Do7paAvvJ8PBxTdak/b
	plveRIanWqVLadSDbvKsyGKFHbvmPcK+LVhRTsS18Cj2Qds5We0gy2/nOBWUw+W+YdHGDsWhea9x4
	9VZDu9bvz67nQK37+YhitYQqA+kW9mlVrdX5FylyS2HSi7C2vaM1YuEQ9BXirakhWHy8zPa9aqpYc
	6tVh9fkAze54go+krrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUhaE-00000001reg-3J39;
	Fri, 19 Jul 2024 06:59:14 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUhaB-00000001rdr-2VrV
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 06:59:13 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3d93f9c793fso901573b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 23:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721372350; x=1721977150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Weu/42V7gECXMih3fbVRqu0U+HL7dgFNDXvO7croHQU=;
        b=Po1wuV1M4OZuuNaLoRnFZgWKYhC7xvJnWUCOOmW3s3q1pskGMe+hL4FiUE7W8BuEiO
         QQWdJWM5W4IvYj4lW6ZCZrtxZrnxl5ncd1mh8eiuhrRBoRayAHFgn1lQwtLUANsv6h7X
         2FqPjyRqnp9KLd8AtQHUagnYPqAM3h8rWgWZFklyhWa3CbWQnlKZB8wazTCKD6uWbqSa
         iQm3DTZKOU9rZHy7V9UNH1iqpgfolQxb94DenDPkWyiWwIdeWFk7B9LNa6Nwt1aSsugJ
         PzKHd2ysaNdlLJ3x0BPRMQv8ltRMCU+cPaKUUsF8ykmS3HzckK+8qVIix9xjGAWrrpgR
         p0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721372350; x=1721977150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Weu/42V7gECXMih3fbVRqu0U+HL7dgFNDXvO7croHQU=;
        b=CmW6t9si1EePHlPxCc/WdxRikj+BWDN3P/5W48L6RSZTTuA5bJ6NiyTaw5SqVlcRI/
         kn4sPS7VPUrpsyxZ2uC4ETklmU4AwWvXihcEs3Pxe+pEY90Wkiw4fV3kEqxbfpdmoM+u
         B890P3tNaGInVIJoLVPpFMvw5dGN3Uu0b84X7XRTYMSbnGGYnqFlQnYDCYLl4GFIg832
         VE8lYJ5l77h3eBckKETA16dAkLvdIT9IFUPNT6nIfqDhm+9ApVkKdRDHf9MceYjUF99G
         L0pEwGh8SUwUbJGoEdYEvdr6Ps4gvfUCsKiaQq8F1raEd7m5biWjO2HCBy5E1zqxwl7z
         0maA==
X-Forwarded-Encrypted: i=1; AJvYcCV+XjVUjK/BVTRuEYMc2oLFLhx8YvZtjBI1J+NTPT0G7uZWO2Rm/2JKxbkLNdABjQ7lOSn/WewbNe3AmNvfElm5ZTRufbaAM9W5ctKa/blY
X-Gm-Message-State: AOJu0Yz4NeFSFRRzkteyGAoPPQ/L+3nyBSIJfdxHfMU03gq7vMEhL++D
	suoOWPibBrkFLVEZDWkywaJGLPfY8QkJXAzLF2We27Fux/B1KzOVK5OgjEDGncZJYyMqh7PHOwp
	2Wq9ZXdQI1HhtIFUaf5BxQ40yi/vKoFVqnWdFXw==
X-Google-Smtp-Source: AGHT+IG9ze+TAPgWUR4nBh2DXYtPskGwtSbGl8cv6Jg7P0RUvU2chBzq3BE4fSR2DgpzMlQ7F8+KPBWwQXlhETkveQ4=
X-Received: by 2002:a05:6808:13c7:b0:3d5:5e18:cf32 with SMTP id
 5614622812f47-3dad1f999a9mr8556178b6e.48.1721372350441; Thu, 18 Jul 2024
 23:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-3-yongxuan.wang@sifive.com> <727b966a-a8c4-4021-acf6-3c031ccd843a@sifive.com>
In-Reply-To: <727b966a-a8c4-4021-acf6-3c031ccd843a@sifive.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 19 Jul 2024 14:58:59 +0800
Message-ID: <CAMWQL2g-peSYJQaxeJtyOzGdEmDQ6cnkRBdFQvLr2NQA1+mv2g@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_235911_667371_1B15D0FF 
X-CRM114-Status: GOOD (  21.78  )
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

SGkgU2FtdWVsLAoKT24gRnJpLCBKdWwgMTksIDIwMjQgYXQgNzozOOKAr0FNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIDIwMjQtMDctMTIg
MzozOCBBTSwgWW9uZy1YdWFuIFdhbmcgd3JvdGU6Cj4gPiBBZGQgZW50cmllcyBmb3IgdGhlIFN2
YWRlIGFuZCBTdmFkdSBleHRlbnNpb25zIHRvIHRoZSByaXNjdixpc2EtZXh0ZW5zaW9ucwo+ID4g
cHJvcGVydHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2V4dGVuc2lvbnMueWFtbCB8IDI4ICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gaW5kZXgg
NDY4YzY0NjI0N2FhLi5lOTFhNmY0ZWRlMzggMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBA
QCAtMTUzLDYgKzE1MywzNCBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAgIHJhdGlmaWVk
IGF0IGNvbW1pdCAzZjllZDM0ICgiQWRkIGFiaWxpdHkgdG8gbWFudWFsbHkgdHJpZ2dlcgo+ID4g
ICAgICAgICAgICAgIHdvcmtmbG93LiAoIzIpIikgb2YgcmlzY3YtdGltZS1jb21wYXJlLgo+ID4K
PiA+ICsgICAgICAgIC0gY29uc3Q6IHN2YWRlCj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8
Cj4gPiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFN2YWRlIHN1cGVydmlzb3ItbGV2ZWwgZXh0
ZW5zaW9uIGZvciBTVy1tYW5hZ2VkIFBURSBBL0QKPiA+ICsgICAgICAgICAgICBiaXQgdXBkYXRl
cyBhcyByYXRpZmllZCBpbiB0aGUgMjAyNDAyMTMgdmVyc2lvbiBvZiB0aGUgcHJpdmlsZWdlZAo+
ID4gKyAgICAgICAgICAgIElTQSBzcGVjaWZpY2F0aW9uLgo+ID4gKwo+ID4gKyAgICAgICAgICAg
IEJvdGggU3ZhZGUgYW5kIFN2YWR1IGV4dGVuc2lvbnMgY29udHJvbCB0aGUgaGFyZHdhcmUgYmVo
YXZpb3Igd2hlbgo+ID4gKyAgICAgICAgICAgIHRoZSBQVEUgQS9EIGJpdHMgbmVlZCB0byBiZSBz
ZXQuIFRoZSBkZWZhdWx0IGJlaGF2aW9yIGZvciB0aGUgZm91cgo+ID4gKyAgICAgICAgICAgIHBv
c3NpYmxlIGNvbWJpbmF0aW9ucyBvZiB0aGVzZSBleHRlbnNpb25zIGluIHRoZSBkZXZpY2UgdHJl
ZSBhcmU6Cj4gPiArICAgICAgICAgICAgMSkgTmVpdGhlciBTdmFkZSBub3IgU3ZhZHUgcHJlc2Vu
dCBpbiBEVCA9PiBJdCBpcyB0ZWNobmljYWxseQo+ID4gKyAgICAgICAgICAgICAgIHVua25vd24g
d2hldGhlciB0aGUgcGxhdGZvcm0gdXNlcyBTdmFkZSBvciBTdmFkdS4gU3VwZXJ2aXNvcgo+ID4g
KyAgICAgICAgICAgICAgIHNvZnR3YXJlIHNob3VsZCBiZSBwcmVwYXJlZCB0byBoYW5kbGUgZWl0
aGVyIGhhcmR3YXJlIHVwZGF0aW5nCj4gPiArICAgICAgICAgICAgICAgb2YgdGhlIFBURSBBL0Qg
Yml0cyBvciBwYWdlIGZhdWx0cyB3aGVuIHRoZXkgbmVlZCB1cGRhdGVkLgo+ID4gKyAgICAgICAg
ICAgIDIpIE9ubHkgU3ZhZGUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1l
IFN2YWRlIHRvIGJlCj4gPiArICAgICAgICAgICAgICAgYWx3YXlzIGVuYWJsZWQuCj4gPiArICAg
ICAgICAgICAgMykgT25seSBTdmFkdSBwcmVzZW50IGluIERUID0+IFN1cGVydmlzb3IgbXVzdCBh
c3N1bWUgU3ZhZHUgdG8gYmUKPiA+ICsgICAgICAgICAgICAgICBhbHdheXMgZW5hYmxlZC4KPiA+
ICsgICAgICAgICAgICA0KSBCb3RoIFN2YWRlIGFuZCBTdmFkdSBwcmVzZW50IGluIERUID0+IFN1
cGVydmlzb3IgbXVzdCBhc3N1bWUKPiA+ICsgICAgICAgICAgICAgICBTdmFkdSB0dXJuZWQtb2Zm
IGF0IGJvb3QgdGltZS4gVG8gdXNlIFN2YWR1LCBzdXBlcnZpc29yIG11c3QKPiA+ICsgICAgICAg
ICAgICAgICBleHBsaWNpdGx5IGVuYWJsZSBpdCB1c2luZyB0aGUgU0JJIEZXRlQgZXh0ZW5zaW9u
Lgo+ID4gKwo+ID4gKyAgICAgICAgLSBjb25zdDogc3ZhZHUKPiA+ICsgICAgICAgICAgZGVzY3Jp
cHRpb246IHwKPiA+ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3ZhZHUgc3VwZXJ2aXNvci1s
ZXZlbCBleHRlbnNpb24gZm9yIGhhcmR3YXJlIHVwZGF0aW5nCj4gPiArICAgICAgICAgICAgb2Yg
UFRFIEEvRCBiaXRzIGFzIHJhdGlmaWVkIGF0IGNvbW1pdCBjMWFiY2NmICgiTWVyZ2UgcHVsbCBy
ZXF1ZXN0Cj4gPiArICAgICAgICAgICAgIzI1IGZyb20gdmVkLXJpdm9zL3JhdGlmaWVkIikgb2Yg
cmlzY3Ytc3ZhZHUuIFBsZWFzZSByZWZlciB0byBTdmFkZQo+Cj4gU2hvdWxkIHdlIGJlIHJlZmVy
ZW5jaW5nIHRoZSBhcmNoaXZlZCByaXNjdi1zdmFkdSByZXBvc2l0b3J5IG5vdyB0aGF0IFN2YWR1
IGhhcwo+IGJlZW4gbWVyZ2VkIHRvIHRoZSBtYWluIHByaXZpbGVnZWQgSVNBIG1hbnVhbD8gRWl0
aGVyIHdheToKPgo+IFJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KPgoKWWVzLCB0aGlzIGNvbW1pdCBpcyBmcm9tIHRoZSBhcmNoaXZlZCByaXNj
di1zdmFkdSByZXBvLiBPciBzaG91bGQgSSB1cGRhdGUgaXQgdG8KImNvbW1pdCBjMWFiY2NmICgi
TWVyZ2UgcHVsbCByZXF1ZXN0ICAjMjUgZnJvbSB2ZWQtcml2b3MvcmF0aWZpZWQiKSBvZgpyaXNj
dmFyY2hpdmUvcmlzY3Ytc3ZhZHUuIj8KClJlZ2FyZHMsCllvbmctWHVhbgoKPiA+ICsgICAgICAg
ICAgICBkdC1iaW5kaW5nIGRlc2NyaXB0aW9uIGZvciBtb3JlIGRldGFpbHMuCj4gPiArCj4gPiAg
ICAgICAgICAtIGNvbnN0OiBzdmludmFsCj4gPiAgICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ID4g
ICAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBTdmludmFsIHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5z
aW9uIGZvciBmaW5lLWdyYWluZWQKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
