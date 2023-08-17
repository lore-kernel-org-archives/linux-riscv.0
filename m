Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A064FC2FC0E
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BrCwP1yPmKygr8tgyhr/q5U5G9/0Zyfqvk0bDS0+ls=; b=1H862XPgfz0zWV
	3HUJsWLBOvbcNUBdBs01aw2Ik5oN9FOOJyFj9kMxTXvBffuiw/MWbasttj7URwiD2/gRUA8OxQc3k
	OAzu/PEFFT+NaNIGPxnloetpzknMlD9fcp3OU72wO+6sjVmgtaiwfTEiuPfIaEsesMtVpfYd7baeY
	1Dk/FSGyplNnNZ2dsZGbRv6+R3bTl0/pkbTVWC2Zk6h3SzD12fcFb5SGnnme4Qfcbn33xfYVQmIMX
	/OIrdOIeXtrRFpdy8QKTYaLT0BfhoNNtFVTY8z7i876Xjn9DnL/bRtI+/ZTVuCgaRXkgjHv0vwcxD
	5wRfNy3Ju0/2R6DZmHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXDy-005hhT-1t;
	Thu, 17 Aug 2023 07:15:18 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXDv-005hgo-2d
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 07:15:17 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-76d7fcae695so11737685a.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 00:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692256513; x=1692861313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZxONYRYUA2SIICDRecfca1lVWlX5qvboAgMcTP29Gk=;
        b=dsvxmPdzfrxDI3p/zUDrAPmQkNNBGN69/EAEF4WFUrBWuvF7ZA52OZECbyFkdnZzpY
         cH0r/ziXL1FU+FyOhwFo416k0I+1JZMsyqpd9//MLy0JiqPFJQ8NN9LhYgGrUtOZNUrc
         45N/+Q+FYyFUhqL+U0g6gXfXPf1vM7I+XVhSM6LJlbqcxR+bZShI0yEcjYt6UFBxH7pK
         ycfz/zbsESGtumvi8Cqm2oQ9dgMDn+18YiROzH3k8Znsy7HCddtqXT00EwpnQC/fmX+Q
         /05aTm8LyNeC+nlCJeQCZOYqeQ2d9AndA28ITWggTg24jtyi6SDpel6VmxIDwdq6OEHd
         XNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256513; x=1692861313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZxONYRYUA2SIICDRecfca1lVWlX5qvboAgMcTP29Gk=;
        b=H2ScgOEdBMlZXYJ9L33lF42z+sXn6o/WoZ0AXeEkNQ9UjgRGBcZt6yoYznQaKpfYRn
         xahrG9Errw/mcV7XH1jy+HPMbbIyHD982VLDQGetjK1KNEKt/UzeJnIjRJy/G/1/azX3
         9L6VuDAjbouugUCCsxdIjGPGEAE89fnbX+OqEpfGZ4NstnrimcxDAXns4aTylNCDx63C
         wWBHrWp2p6201A1UJVL1VBreRRNL8BEejpojYtRLS3pPwoF6AJzYve7MaI6NVDKCVllD
         5n1ymv+VOqqabflXltuU2vK+FguNIrjkBKp1Z3TK2FceZ+gNusVla9/Hv6JobJ1NOx5Y
         mwUQ==
X-Gm-Message-State: AOJu0YzeWZTIpgmnl9EpHnS6nnKtZTf+OwXEndbQbYmKq3oPXEEosH7b
	nfVfMurpoo1xaRSzbxVIrgATIckFPPpn5tCYnxhKLQ==
X-Google-Smtp-Source: AGHT+IEcxHUtvwqTlfg/2NwjU0sKrHqqk3qgeXLdbA6/VHS9Ia+zSyyV3Ft8nF/ULFeIITB27MmsFCtWcll2+giOMpg=
X-Received: by 2002:a05:620a:2944:b0:76c:b0aa:cfd1 with SMTP id
 n4-20020a05620a294400b0076cb0aacfd1mr5620731qkp.37.1692256512993; Thu, 17 Aug
 2023 00:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230816034009.2614866-1-nick.hu@sifive.com> <20230816-mural-portion-5b22d90e83fd@wendy>
In-Reply-To: <20230816-mural-portion-5b22d90e83fd@wendy>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 17 Aug 2023 15:15:02 +0800
Message-ID: <CAKddAkCawPAAcwKr58YJ-Yiw49946GUniJGMDumsPFXaKLDm=Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: suspend: Add syscore ops for suspend
To: Conor Dooley <conor.dooley@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ajones@ventanamicro.com, mason.huo@starfivetech.com, 
	jeeheng.sia@starfivetech.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_001515_884681_9857CD5D 
X-CRM114-Status: GOOD (  15.44  )
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

SGkgQ29ub3IKCk9uIFdlZCwgQXVnIDE2LCAyMDIzIGF0IDg6MzTigK9QTSBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDE2LCAy
MDIzIGF0IDExOjQwOjA5QU0gKzA4MDAsIE5pY2sgSHUgd3JvdGU6Cj4gPiBTYXZlIGFuZCByZXN0
b3JlIHRoZSBGUFUgYW5kIHZlY3RvciBzdGF0ZXMgd2hlbiBzeXN0ZW0gc3VzcGVuZC4gSWYgYQo+
ID4gdGFzayBpcyB0aGUgb25lIHdobyBwZXJmb3JtcyB0aGUgc3VzcGVuZCBmbG93IGFuZCBpdCBh
bHNvIGRvIHNvbWUKPiA+IGZsb2F0aW5nIG9yIHZlY3RvciBvcGVyYXRpb25zIGJlZm9yZSB0aGUg
c3VzcGVuZCwgd2Ugc2hvdWxkIHNhdmUgYW5kCj4gPiByZXN0b3JlIHRoZSBGUFUgc3RhdGVzIGFu
ZCB2ZWN0b3Igc3RhdGVzIGZvciB0aGlzIHRhc2suCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTmlj
ayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUg
PGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+Cj4gV2hhdCB3YXMgQW5keSdzIGNvbnRyaWJ1dGlvbiB0
byB0aGUgcGF0Y2g/Cj4gQXJlIHlvdSBtaXNzaW5nIGEgY28tZGV2ZWxvcGVkLWJ5IHRhZz8KPgpI
ZSBmaXhlZCBzb21ldGhpbmcgcmVsYXRlZCB0byB2ZWN0b3IuCkknbGwgYWRkIGNvLWRldmVsb3Bl
ZC1ieSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiBBbHNvLCBJJ20gYSBiaXQgY29uZnVzZWQgYnkg
dGhlIGNvbW1pdCBtZXNzYWdlIGR1ZSB0byBhIGxhY2sgb2YKPiBrbm93bGVkZ2UgaGVyZSAtIGlz
IHRoaXMgYSBmaXggb3IgYSBuZXcgZmVhdHVyZT8KPiBJdCByZWFkcyBhcyBpZiB0aGluZ3MgYXJl
IG5vdCBiZWluZyBzYXZlZC9yZXN0b3JlZCBjb3JyZWN0bHksIGJ1dAo+IHRoZXJlJ3Mgbm8gImZp
eCIgcmVsYXRlZCBrZXl3b3JkcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugbm9yIGEgRml4ZXM6Cj4g
dGFnLgo+Cj4gVGhhbmtzLAo+IENvbm9yLgpJJ2xsIHJlcGhyYXNlIHRoZSBjb21taXQgbWVzc2Fn
ZS4KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgpUaGFua3MsCk5pY2sKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
