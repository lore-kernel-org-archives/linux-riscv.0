Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A44EC83039
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+R7VV6LsV/ZroWZJ2NqRUbsjeU1sWirCXaNK34L6rTg=; b=zeOSzfo4W4yDNF
	PoC+R5NaTF4Z2hxg/F/poJLTOLFumfYt6AN8bfJfHvDH2ios8I4iVl3RCbh2FaticG33A+vuxX7bl
	tm9a5wgrn/NYEhpVMDCDEdgnJYuVlkfLhUpaJm/ckCyWtz8I1EDXlc5Zz1alh7pJJKp2EUjfafdL7
	UPlTO8phej1gV90E6sq2fU9pkJcO8nYSgYCA5iWJyKbSzuSo4BnlHU+11wz3u7s+gJXhuXeC08+MT
	CsHtc1cj9Zb++pM35zhfX5QDTTmRPSm+uRjfTMjhQFOf3yXe+4P5lBm08XDZ9VEdfUydLKEQ7ah/Q
	PmwdQXi2TWXdnVEkIJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWji-00000004UZI-1AzR;
	Tue, 01 Jul 2025 08:53:06 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWfd-00000004Sot-0x7w
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:48:54 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e733a6ff491so2643090276.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 01:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751359732; x=1751964532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ham4MleQtpYSqIWPo8fq/MuoFtt+t8Ya59SZXOm39+s=;
        b=BS+T+bQXPB2ieMQRle1lJn6HG6YaavMJqF14C/BT8MHRKJZe+98MAIqvRMHlN2jiN2
         5bENh2E/Kjn2fA74ACpozZC1OzTGcHHn3Vp/39JqH9/BwgNZgmJZyIXS+PBPuMw2to5U
         Q3XWzrs91VP3L7hFaDRXQTWAvpTZVXxQytryXkfn/g27XT3L3x5S8mm0/UNWI5LNLGI7
         KtdG7Ot4Jrzdu1dw7KR9sVXmRXD6sqxpxTSfQYlUNsy92Ox4R6yCL7ImwYT33aBljIxF
         mL1sj1gY5jxnif50vMjoRmMV9tqi0B1/luHnAnt4gARJPjPipSbOHP4/JTqB0zeHRVfv
         fM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359732; x=1751964532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ham4MleQtpYSqIWPo8fq/MuoFtt+t8Ya59SZXOm39+s=;
        b=wbyiXNOFFcxVlIaIWkf2K/nxPwinnYqBA6p3KFoknJW80cyOSAYnHeyLCJ9DNNbdtV
         zsr3eZk+gn7WcEtIMqbY5POPYu0B6asMqUc0MUYkGmXUbTZ8852ZZa55ht0JOXGikm26
         PCvJG0qO7PfFlyKlovYUq47Ulp48ahgFk3RkGxE2YAKl6cc5tUi+Oi0OpsCZJwF3BqKb
         5OsZCsD5OdP4HBbNveCd3jheVIRrAiNgwweA5Rj4dNBJUrLj4oArYgTwoOEVNR2p9Owj
         LHRbMblmDSDd7VT0K00llX2+x57CofOjLIvWRdFlKl4iV6OgJ9ovkIcl6zdofjsPgmOr
         Gl9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpRrwqvoAh1afdc0+Mvc0f36oqm8/saTx+9W/9v86SjU1kzqqtcqlRc+FyoKNy2aMfJAUKZt+lQA1twQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzprHsGA0EQmsPAjbyOsflNTuC0INnYDpveuuYDNxMNguBwsKPP
	cEYjoFFzIphjLFqQT2FnMQG36mfZcf3hdEDOpvzgVEMPYq2+S4E16/5e2h3hYHMkBqzg381Hpqd
	KxBnLHJn5N+d0HOG2PokH77Jzc1SKYLwQgTFeTwou7Q==
X-Gm-Gg: ASbGncvgJX1/JfDPhsQ29KCJsCg7IztTkIHedPaWgA2p5tuOK8HyFGsDwUkqGjVaU9P
	b/6QSqEj2y+mor7DVpchG1CPovQizxJcoI4k2U2omQqEphakgQTNBdShA7Gm5MsW1LbN1eO0glW
	oHj8wbuBprPNnwFVXkhN6UWMQV/GwHiik4xlbIbR637vTWkVMf
X-Google-Smtp-Source: AGHT+IExwbxuXz67r7i2U0Hj9e39nnEuFRzklLDURAXbWXk0DV903xSBiVjsaBHg1u3FdNeBklfefUYYXWQaY3P289M=
X-Received: by 2002:a05:690c:45ca:b0:70e:29af:844a with SMTP id
 00721157ae682-71517196047mr247551697b3.18.1751359731954; Tue, 01 Jul 2025
 01:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-7-ab6ee9171d26@riscstar.com> <ebc16dbe-2405-4956-91a0-bcce9f199326@kernel.org>
In-Reply-To: <ebc16dbe-2405-4956-91a0-bcce9f199326@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 1 Jul 2025 16:48:41 +0800
X-Gm-Features: Ac12FXzG_24euqC2ksqQUMdli-9vCkce_uhDVNzQHQHTjfNnkSCnW6ua-Xfs0vo
Message-ID: <CAH1PCMa2dB1fefzGgo-kKfgAdou_KaDSvTDsvYPjsGKODHETCA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3
 and Milkv Jupiter
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_014853_268733_F9241889 
X-CRM114-Status: GOOD (  16.33  )
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

T24gVHVlLCBKdWwgMSwgMjAyNSBhdCAzOjM24oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDAxLzA3LzIwMjUgMDc6MzcsIEd1b2RvbmcgWHUg
d3JvdGU6Cj4gPiBFbmFibGUgdGhlIFBETUEwIG9uIHRoZSBTcGFjZW1pVCBLMS1iYXNlZCBCYW5h
bmEgUGkgRjMgYW5kIE1pbGt2IEp1cGl0ZXIKPiA+IGJvYXJkcyBieSBzZXR0aW5nIGl0cyBzdGF0
dXMgdG8gIm9rYXkiLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmdA
cmlzY3N0YXIuY29tPgo+ID4gLS0tCj4gPiB2MjogYWRkZWQgcGRtYTAgZW5hYmxlbWVudCBvbiBN
aWxrdiBKdXBpdGVyCj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sx
LWJhbmFuYXBpLWYzLmR0cyAgIHwgNCArKysrCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMS1taWxrdi1qdXBpdGVyLmR0cyB8IDQgKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1p
dC9rMS1iYW5hbmFwaS1mMy5kdHMKPiA+IGluZGV4IGZlMjJjNzQ3YzUwMTJmZTU2ZDQyYWM4YTdl
ZmRiYmRiNjk0ZjMxYjYuLjM5MTMzNDUwZTA3ZjJjYjljYjIyNDdkYzAyODQ4NTFmOGM1NTAzMWIg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBp
LWYzLmR0cwo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFw
aS1mMy5kdHMKPiA+IEBAIC00NSwzICs0NSw3IEBAICZ1YXJ0MCB7Cj4gPiAgICAgICBwaW5jdHJs
LTAgPSA8JnVhcnQwXzJfY2ZnPjsKPiA+ICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICB9Owo+
ID4gKwo+ID4gKyZwZG1hMCB7Cj4KPgo+IERvZXMgbm90IGxvb2sgbGlrZSBwbGFjZWQgYWNjb3Jk
aW5nIHRvIERUUyBjb2Rpbmcgc3R5bGUuIFdoYXQgc29ydCBvZgo+IG9yZGVyaW5nIFNwYWNlbWl0
IGZvbGxvd3M/Cj4KCkFncmVlZC4gV2Ugc2hvdWxkIGVzdGFibGlzaCBhIGNvbnNpc3RlbnQgb3Jk
ZXJpbmcgcnVsZSBmb3IgU3BhY2VtaVQgYm9hcmQKRFRTIGZpbGVzLiBBY2NvcmRpbmcgdG8gdGhl
IGNvZGluZyBzdHlsZSBkb2N1bWVudGF0aW9uLCB0aGVyZSBhcmUgdHdvCmFjY2VwdGFibGUgYXBw
cm9hY2hlcyBmb3Igb3JkZXJpbmcgbm9kZSByZWZlcmVuY2VzIGluIGJvYXJkIERUUyBmaWxlczoK
CiJXaGVuIGV4dGVuZGluZyBub2RlcyBpbiB0aGUgYm9hcmQgRFRTIHZpYSAmbGFiZWwsIHRoZSBl
bnRyaWVzIHNoYWxsIGJlCm9yZGVyZWQgZWl0aGVyIGFscGhhLW51bWVyaWNhbGx5IG9yIGJ5IGtl
ZXBpbmcgdGhlIG9yZGVyIGZyb20gRFRTSSwgd2hlcmUKdGhlIGNob2ljZSBkZXBlbmRzIG9uIHRo
ZSBzdWJhcmNoaXRlY3R1cmUuIgoKUmVmZXIgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2R0cy1jb2Rpbmctc3R5bGUucnN0CgpNeSBwcmVmZXJlbmNlIHdvdWxkIGJlIGFscGhh
YmV0aWNhbCBvcmRlcmluZyBmb3IgZWFzeSBtYWludGFpbmFiaWxpdHkuIEhvd2V2ZXIsCkknZCBs
aWtlIHRvIGhlYXIgWWl4dW4ncyBwZXJzcGVjdGl2ZSBvbiB0aGlzIGJlZm9yZSB3ZSBzdGFuZGFy
ZGl6ZSB0aGUKYXBwcm9hY2ggYWNyb3NzIGJvdGggYm9hcmQgRFRTIGZpbGVzLCBCUEktRjMgYW5k
IE1pbGtWIEp1cHRpZXIuCgpUaGFua3MuCkd1b2RvbmcKCj4KPgo+IEJlc3QgcmVnYXJkcywKPiBL
cnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
