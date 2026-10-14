Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219CBCC6B19
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 05:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4y8ucDs/mKlJ9LmYgnM3GQvHhE3ZYU55Hw99MBrRUdw=; b=gD0Dxg51q/SRsm
	b1mJg0ktGGQnbaLfIYflGCBgOTG7pYmeVrzy399UkTR3/F+gGqnin6YW+myLJStyOpPZfc+Xsnesu
	+Boe6Pgq3Gn0TYDmLvb7eWoOcYD9MQB9SRopsZ/Wf8kcV/+E7fNxmtw2301OhNfVdpLcaGyTKrFxo
	E+NdUFEOJd/TmPlLM3kS10moxRIp5MHQ15bQ/y/CsPXVSv0DEqR9LKArn3dAYgk3QbObzA9sRGIEo
	Yq619PJclVabXDvg61yO4YnlUqYH+c8GMyhesdZw3Kt2CjLDvoxu/q08BPJCh0Zn5EXy3mcKfZb9M
	2th2APIdJOisW+4NzEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGs00-0000000EZmx-3KL9;
	Wed, 14 Oct 2026 05:58:00 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGrzy-0000000EZmf-2Maq
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 05:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3lrknLW5y4akh4ysEcAiAVU/GpJHM5ZHBlTirOF66NE=; t=1791957478; x=1792821478; 
	b=l/x7atiemECrh/4dHW/8VtnXeVoFF2lb2AT5WvEjiigfTM9PrGxema1iq9LC/tGCjkovv0JaGDr
	hkrZJd4YtPfxnvjm2ud/loB5WRY61mDn05koD+DplOcH8MvlIqQYeAPcF8j9kTfR8FxGPB/y0ZjQH
	AVRa0bKdmE1KseQKC7B0Ce6RVmCniFlQoU/1mJXPn36ym6Xipp0qyW/j+O9GZrVuQjRGKyroMeYHh
	/JOdB/33cHXUqC6V6bBuuN4SxaVaSCnmlmakJWQ/7ND/KncmxKtVxqYLMHMxBg5PsAh277DRud4D7
	AXf4mD+DrUg3Sc2STbIFTrAv+p/ZIqCykKTA==;
Received: from mail-dl1-f54.google.com ([74.125.82.54])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xGrzu-004WiV-CZ
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 01:57:54 -0400
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1517bda04a0so2337254c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 22:57:54 -0700 (PDT)
X-Gm-Message-State: AFq9FYLErw7253h9GQXkQkNKMQr00bzRWVWG4Pwf6g+H6kRRLfas7KA6
	L0b9WRPBWVNaEFfAqlhPPCN3Hj7KsnvXijl+4qDqg3x9VscGqQH/ijn/Z0cLg2nIdDJS9ICUYGM
	z1g2asV8p7HY8mr1SvWqyJCWKyXboKmE=
X-Received: by 2002:a05:701b:4508:10b0:154:fa0b:6df1 with SMTP id
 a92af1059eb24-16a5e49d6c9mr18358639c88.37.1791957473445; Tue, 13 Oct 2026
 22:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261009221957.760606-1-nickolai@csail.mit.edu>
 <20261010155110.764010-1-nickolai@csail.mit.edu> <as8FTtH7yzeKCpE7@xhacker>
In-Reply-To: <as8FTtH7yzeKCpE7@xhacker>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Wed, 14 Oct 2026 01:57:41 -0400
X-Gmail-Original-Message-ID: <CADGQE7EUNKbWUyr4thAs2XqCaykjjWByfvcRVGD2GWdBUT_UUQ@mail.gmail.com>
X-Gm-Features: AclHuK8Z3adooWzqDYNqaJpR4xFHG0X3uEiFJENAdhdcUonFyJbNwabOncI3VwA
Message-ID: <CADGQE7EUNKbWUyr4thAs2XqCaykjjWByfvcRVGD2GWdBUT_UUQ@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Fix icache flush being skipped for a second mm
 mapping an exec folio
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_225758_823463_EBADFD2F 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgMTI6NTDigK9BTSBKaXNoZW5nIFpoYW5nIDxqc3poYW5n
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE5vdyB0aGUgcGF0Y2ggbG9va3MgYmV0dGVyLiBJIG9ubHkg
aGF2ZSBvbmUgY29uY2VybjogUlYzMiBkb2Vzbid0IGhhdmUKPiBuYXRpdmUgYXRvbWljNjQsIHNv
IGZhbGxzIGJhY2sgdG8gZ2VuZXJpYyBhdG9taWM2NCBpbXBsZW1lbnRhdGlvbiB3aGljaAo+IGRp
c2FibGVzIGxvY2FsIGlycSwgdGFrZXMgc3BpbiBsb2NrLCB0aGVuIGRvZXMgdGhlIG9wZXJhdGlv
biwgdW5sb2NrLAo+IHJlc3RvcmUgbG9jYWwgaXJxLCBzbyBJJ20gbm90IHN1cmUgd2hldGhlciBv
dmVyaGVhZCBmb3IgUlYzMiBpcyB0b28KPiBoZWF2eSBvciBub3QuIEhvd2V2ZXIsIEkgaGF2ZSBu
byBvdGhlciBiZXR0ZXIgc29sdXRpb24gZm9yIFJWMzIuCgpPbmUgb3B0aW9uIHdvdWxkIGJlIHRv
IGRpc2FibGUgdGhpcyBvcHRpbWl6YXRpb24gb24gUlYzMiAoaS5lLiwgdW5kbwowMTI2MWUyNGNm
YWIgb24gUlYzMiwgYnkgY2FsbGluZyBmbHVzaF9pY2FjaGVfYWxsKCkgYXMgYmVmb3JlLCBhbmQK
a2VlcCB0aGUgb3B0aW1pemF0aW9uIHdpdGggdGhlIGljYWNoZV9nZW4gZml4IG9uIFJWNjQpLiAg
VGhpcyBtaWdodCBiZQphIHJlYXNvbmFibGUgdHJhZGUtb2ZmLCBpZiBSVjMyIHRlbmQgdG8gYmUg
cmVsYXRpdmVseSBzbWFsbCwgYW5kIHRoZQptYW55LWNvcmUgbWFjaGluZXMgdGhhdCBiZW5lZml0
IGZyb20gdGhpcyBvcHRpbWl6YXRpb24gYXJlIFJWNjQuCgpOaWNrb2xhaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
