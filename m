Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4849DCD8CA8
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 02:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIkFNpqZoCn0hhlc2ILinscR83GcO0ZEO7/jLHR/elI=; b=49rBLbsgiXKrfh
	ibaNqrNxTfUL59pxLik1k8HF6gy5mGwAdKGcH/cZPrTPovd0ZnUliUPg7ic2MnAQ2chPS8hA7GlA9
	CA1lVUKQktLeZMXUD8qPexrt9gws/zcmSN7pMpQqkMw+Nk5WeBmPwZDnWm+J4+ktnCGP15fYPeSUE
	KpPJsCA5QZOj6cvMSV5sqMuKV6weVrLlcMvYU1MHi1eQR3O5KVW3Ch7kwKwu9QA3sodwY5G+wBX3b
	ik+YVeP8F5ptj/ZjFEDMz5ZiyQ9AfXbLnCDFP+HWqusw7txvQl/K3Z+A+WI4fztDASLvcXHfYn4Fj
	NOZ0u9wmqLp5rQX0Hn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8Hm-00000006fxN-3DI4;
	Wed, 10 Jun 2026 02:03:19 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8Hi-00000006fwu-1oLQ
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jun 2026 02:03:16 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7e71198e0adso1768312a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 19:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781056993; cv=none;
        d=google.com; s=arc-20240605;
        b=F1iMGNPxrvcz9ZW8C3VO9k5gjZOH8Heq/tDH+ns/nC7PXr1Y0kdeEx2Rsmq2gyOMEB
         MYZKGGdI+WIUnqBoj40+mRK0FuHt1Z7z5Lggy4WPmVyr2bMyYEa1TEEtC8o890wQNGIr
         K2R4vqKl7ZRKYaP+1pH3uRazAg1cDQwEs3Fppw+E6YI/o/PxMsMQY+rUSedwW00Fx5ee
         LpNvzx71FcIrWrVToRc11OF/Ow3haepbvuU3HBYaDJyN3inbBQ9NBQd87i4CSP2EK2Cu
         5qoL+rBQsx1DBbNb2xPIcMtRYdPDdxz7RR+uq93xZkfEXw5F731J5HSPN/PmdTn7naUc
         qC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UVLKzHHipOPmzpzXCQLBwTllh/qtjlZjlrowYfX4R2g=;
        fh=xzpcqBUZMXFWlobf0StPAMMJv9+hhXr3th3Ht6lJvDU=;
        b=B3BdjRbgiTzAlIndmgNEEXsrn6gcpaeHB4KGeZCFoyQuGkJ9QLGgrfHRSTHe62qZma
         AH8UUskQDqJyAIZfy1rrUgRbIU9e1BFx57JjB3/2mQo3Y+ATOK6T9l3TXbiHLYFTQkzD
         mlmZjibmLeIaqeXaTKLswqIcAK+aBhNdeEUDWF7dWOMAJvMjabrDrinbSHXefh+Y/rXD
         b2xJ0ETb6+HMz2Va3CMGySQR7sktyRird5IRFjBvpPq10ZA5O+SK4EUTs9UXipVwzBdN
         I7CKUhygPnJQYjKrfuvQjv1lzOhhdm9Z6X9oP/3y37jyMlhZk24W3bRSuq/AWg8wUZqU
         vjOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781056993; x=1781661793; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVLKzHHipOPmzpzXCQLBwTllh/qtjlZjlrowYfX4R2g=;
        b=T5z3ruCKb2AbUhIDm/ov9GmGcqHqsdWkEoQDg/lh5puDK3Rb9S9TW/YjKj72tXP1W/
         ipoHJGKeZMFhJkydaEAyFB7XB5ytExpFdkgzTizg5nGtQkhQ3tiAGt/ylumTGyRxLtqe
         T45NGUlbmqTgqypV1NHWziRW9R97ThxZtTiBpew8QMquT0n5FxEYwgKFl7pMTd5ziaMr
         rKfbpbi2Jw1CmS8hhmvUenl/sl8Ktd/6Qqjq4WzD58DId1myArQ4HdIlNMXPJ0fzUm0L
         QA65x8xkrTRvaTbKX/2C0A33rzpKqOnuSZa7o8wpbnnbJcW9/oxFihoyvksEtqhcwHNa
         8nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781056993; x=1781661793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVLKzHHipOPmzpzXCQLBwTllh/qtjlZjlrowYfX4R2g=;
        b=NoIHosKKjz1vSlKbUro7/py4j+dSR8mSY/NrxkrDItCM/hSgbfR2lg5ez1idW2VWnQ
         VAB1f+IRKLk0EzrvunTAqYdQCttPbKJecQwr/hLKuH7ZyIaBxzZOh3oonXna1QtD8WvW
         ifSB3SyTFKuDMzT6mKi03OjkEJbvNJ1LTYKUmRwIH0SJoNHbxkMUYhkr1tMzdIsKqXds
         wY69aIVrcwIj/rASCMeG0aC/2ytCjVFaaSZr4p/oOyI+CUIlJI21pfHNyY+/SEA6IYR6
         tWgwU7IRkPrsZaR3UUTFLX2POIzUD3moX/Y3Lp3QwtIGTtWVso1Eep89qzQ2qpLWjAwM
         qcVA==
X-Forwarded-Encrypted: i=1; AFNElJ8MA+Ptz4XalidRtq9DEY8rRNCZtcXURGBbtX58peNcOHBsC703vX5v5Bk10XW2XGCNu8YRpP4++SjR/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmfck8xqmcAd2DonmalhfptlC72xIENX/CRGa/HHVfsMuDfv3J
	cF/I8K0Nk1/qXAnpgax1/hHIG0nblYLxuwAEibZTcSaym7vmkfu8JNtmUlLQDLRZx+Sbd/jPCR/
	rk5yvfm3I3e64yxOvzFMj8DdY5dFJvNWD9TreHfF5uQ==
X-Gm-Gg: Acq92OHPaYIfOAlRx/lKzvcAWxIQJJDDhkfBdiC/WCP0Czx0YsIORVPyno7NpbBqOzA
	L75f3AYe86du48OhRoj09JRZ0sa1yOVrsut2Ydc4rZsrR2tcQE2iWV+dFYZ8/5q6qE3Z8oLIVKR
	NNHJIHLYiOBymjX3zO4UUXm8FXNHPFDax56WCeeItLWu+wqlocJIFDhwtt4/IPktUc0rf9jGbtt
	v1wrv86Ff1DxzqnuwItfcI4JRiIo1Pv+qMKtX/iZko3Fl18kuiOFpx2RQLQ80ABIfkvHigmvP/M
	QGlqCBXc6QCkWsmIFRZLoRT67Q2NbvJ5KFo=
X-Received: by 2002:a05:6830:81d8:b0:7e7:31c:c121 with SMTP id
 46e09a7af769-7e70c78fc87mr14626623a34.12.1781056993185; Tue, 09 Jun 2026
 19:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260609130021.99899-1-cuiyunhui@bytedance.com>
 <20260609130021.99899-2-cuiyunhui@bytedance.com> <20260609-washboard-fantasize-ddf0a9752df8@spud>
In-Reply-To: <20260609-washboard-fantasize-ddf0a9752df8@spud>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 10 Jun 2026 10:03:01 +0800
X-Gm-Features: AVVi8CdRlV_dg_ea73FD1rM-qQA_K4_GqKNrryZYAfOnnfoVb9mqcROreM8Nqss
Message-ID: <CAEEQ3w=C_z8awtevLhceTgqLW79ONzKTm5MRJeoSTLB9q_CeiQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 1/3] dt-bindings: riscv: clarify Svadu
 boot-time behavior
To: Conor Dooley <conor@kernel.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, andrew+kernel@donnellan.id.au, 
	aou@eecs.berkeley.edu, apatel@ventanamicro.com, apopple@nvidia.com, 
	atishp@rivosinc.com, baolin.wang@linux.alibaba.com, cleger@rivosinc.com, 
	conor+dt@kernel.org, debug@rivosinc.com, devicetree@vger.kernel.org, 
	guodong@riscstar.com, hui.wang@canonical.com, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	liu.xuemei1@zte.com.cn, namcao@linutronix.de, nick.hu@sifive.com, 
	palmer@dabbelt.com, pincheng.plct@isrc.iscas.ac.cn, pjw@kernel.org, 
	qingwei.hu@bytedance.com, ritesh.list@gmail.com, rmclure@linux.ibm.com, 
	robh@kernel.org, wangruikang@iscas.ac.cn, zhangchunyan@iscas.ac.cn, 
	zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_190315_053551_C485B40E 
X-CRM114-Status: GOOD (  23.50  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIEp1biAxMCwgMjAyNiBhdCAxMjowOeKAr0FNIENvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAwOSwgMjAyNiBhdCAw
OTowMDoxOFBNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gQ2xhcmlmeSB0aGF0IHN5c3Rl
bXMgd2hpY2ggYWR2ZXJ0aXNlIG9ubHkgU3ZhZHUgaGF2ZSBoYXJkd2FyZSBQVEUgQS9ECj4gPiB1
cGRhdGluZyBlbmFibGVkIGF0IGJvb3QsIHdoaWxlIHN5c3RlbXMgYWR2ZXJ0aXNpbmcgYm90aCBT
dmFkZSBhbmQgU3ZhZHUKPiA+IG11c3QgZW5hYmxlIFN2YWR1IGV4cGxpY2l0bHkgd2l0aCBTQkkg
RldGVC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRh
bmNlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBRaW5nd2VpIEh1IDxxaW5nd2VpLmh1QGJ5dGVkYW5j
ZS5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sIHwgNiArKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gaW5kZXgg
MmIwYThhOTNiYjIxNC4uYjA5ODg4ZTk5ODhkZSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+
IEBAIC0yOTQsMTAgKzI5NCwxMCBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAgICAgIG9m
IHRoZSBQVEUgQS9EIGJpdHMgb3IgcGFnZSBmYXVsdHMgd2hlbiB0aGV5IG5lZWQgdXBkYXRlZC4K
PiA+ICAgICAgICAgICAgICAyKSBPbmx5IFN2YWRlIHByZXNlbnQgaW4gRFQgPT4gU3VwZXJ2aXNv
ciBtdXN0IGFzc3VtZSBTdmFkZSB0byBiZQo+ID4gICAgICAgICAgICAgICAgIGFsd2F5cyBlbmFi
bGVkLgo+ID4gLSAgICAgICAgICAgIDMpIE9ubHkgU3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBl
cnZpc29yIG11c3QgYXNzdW1lIFN2YWR1IHRvIGJlCj4gPiAtICAgICAgICAgICAgICAgYWx3YXlz
IGVuYWJsZWQuCj4gPiArICAgICAgICAgICAgMykgT25seSBTdmFkdSBwcmVzZW50IGluIERUID0+
IFN1cGVydmlzb3IgbXVzdCBhc3N1bWUgU3ZhZHUgaXMKPiA+ICsgICAgICAgICAgICAgICBlbmFi
bGVkIGF0IGJvb3QuCj4KPiBDb21taXQgbWVzc2FnZSBpcyBtaXNzaW5nIGFuIGV4cGxhbmF0aW9u
IG9mIHdoeSB0aGlzIGJlaGF2aW91ciBjaGFuZ2UgaXMKPiBub3QgcHJvYmxlbWF0aWMuIEFsdGhv
dWdoLCB0byBiZSBob25lc3QsIEkgYW0gbm90IHN1cmUgd2hhdCB0aGUgY2hhbmdlZCB0ZXh0Cj4g
YWN0dWFsbHkgbWVhbnMuIElmIG9ubHkgU3ZhZHUgaXMgcHJlc2VudCwgdGhlbiB0aGUgaGFyZHdh
cmUgZG9lc24ndCBzdXBwb3J0Cj4gU3ZhZGUsIGFuZCB0aGVyZWZvcmUgU3ZhZHUgd291bGQgbmV2
ZXIgYmUgYW55dGhpbmcgb3RoZXIgdGhhbiBlbmFibGVkIHNvCj4gY2hhbmdpbmcgdGhlIHdvcmRp
bmcgdG8gc3BlY2lmeSAiYXQgYm9vdCIgc2VlbXMgbGVzcyBjbGVhcj8KClRoZSAiZW5hYmxlZCBh
dCBib290IiB3b3JkaW5nIGNhbWUgZnJvbSBBbmRyZXcncyBmZWVkYmFjayBvbiB0aGUgcHJldmlv
dXMKdmVyc2lvbjogImFsd2F5cyIgaXMgYSBzZW5zaXRpdmUgdGVybSBoZXJlIGJlY2F1c2UgQURV
RSBpcyB3cml0YWJsZSB3aGVuClN2YWR1IGlzIGltcGxlbWVudGVkLCBhbmQgQURVRT0wIGJlaGF2
ZXMgYXMgdGhvdWdoIFN2YWRlIHdlcmUgaW1wbGVtZW50ZWQuCgpXb3VsZCB0aGlzIHdvcmRpbmcg
d29yaz8KCjMpIE9ubHkgU3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNz
dW1lIGhhcmR3YXJlIFBURSBBL0QKICAgIHVwZGF0aW5nIGlzIGVuYWJsZWQgYnkgZGVmYXVsdC4K
Cj4KPiA+ICAgICAgICAgICAgICA0KSBCb3RoIFN2YWRlIGFuZCBTdmFkdSBwcmVzZW50IGluIERU
ID0+IFN1cGVydmlzb3IgbXVzdCBhc3N1bWUKPiA+IC0gICAgICAgICAgICAgICBTdmFkdSB0dXJu
ZWQtb2ZmIGF0IGJvb3QgdGltZS4gVG8gdXNlIFN2YWR1LCBzdXBlcnZpc29yIG11c3QKPiA+ICsg
ICAgICAgICAgICAgICBTdmFkdSBpcyBkaXNhYmxlZCBhdCBib290IHRpbWUuIFRvIHVzZSBTdmFk
dSwgc3VwZXJ2aXNvciBtdXN0Cj4KPiBUaGlzIGNoYW5nZSBkb2Vzbid0IGFjdHVhbGx5IGRvIGFu
eXRoaW5nLCAidHVybmVkLW9mZiIgYW5kICJkaXNhYmxlZCIKPiBhcmUgdGhlIHNhbWUgdGhpbmcg
LSBhbHRob3VnaCB0aGUgbGF0dGVyIGlzIG1vcmUgZGVzaXJhYmxlIHdvcmRpbmcgSQo+IHRoaW5r
LiBJIGhhdmUgbm8gcHJvYmxlbXMgd2l0aCB0aGlzIHBvcnRpb24gb2YgdGhlIHBhdGNoLgo+Cj4g
PiAgICAgICAgICAgICAgICAgZXhwbGljaXRseSBlbmFibGUgaXQgdXNpbmcgdGhlIFNCSSBGV0ZU
IGV4dGVuc2lvbi4KPiA+Cj4gPiAgICAgICAgICAtIGNvbnN0OiBzdmFkdQo+ID4gLS0KPiA+IDIu
MzkuNQo+ID4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
