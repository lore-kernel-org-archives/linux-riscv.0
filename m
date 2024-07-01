Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C323C3065A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqLCxLyhILaT8lMJ7F8eill2E6XXtFGlHElHHBTSQMk=; b=p0WhAg+rjBN5v1
	ZldwKRd+WArCDHQ157YUzIwF+hXFFvnvnrM5dR7RJiIIvCd288B1DJadmZFTYFfGmMmdD89uTLMNZ
	G10VQeJmNYTR8AioUH2ArcIvYxcR/oqolYFCeOdxKf2erZjUr0dMF2+OT8bBKKjy1Yo0nq3wNKZuN
	5dk81BKoORPnTw9ZYz0fetog/Ak28ntA+NIsOOxh9Vrm/3wwIu0chf50J0W51arRm6cVoUlXFN4Mw
	2anZqVfOrU9iTFVuEteBB3lb+Xsj4GDhQ8ZfYY+6OOhcK40B1Ap1XvGLz1h6tUF3MgxaRyK5PvY17
	OJ3qDWtYws5Y6YhgeZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOLqY-00000004TNM-3j6H;
	Mon, 01 Jul 2024 18:33:51 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOLqU-00000004TLv-3H81
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 18:33:49 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so3426884e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 11:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719858824; x=1720463624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o768OFO8ymKF2WN6iJdKjiEs5teokkn43UIghq2x2Fs=;
        b=HH+4LfUodfYmBofk1/9gPO2ymft6XUnXqkSeEO4QZ2s1eZqbcq5/0I/Bh4SRwhBL7L
         BFxuVrCixwcMgFIzQUdPsZ92LoeBj+sFis9YCrXCRBWpQtShrrSpoI9F6h5Wey5Ontw6
         l7fDDKbSwcQKPaphpuKucJNjj7awLgxSNuSrTWtVRgtrjT0t/X95xzFwhVVfQZmTq/1d
         ACjCue1oW97Z+ziP2wTq0GFW3gCcbtTYW5mbqPwZt6H79NrcoEZZTMTMAVkcpWoS7fqg
         ReAtLvgZOkj4cSuKcr7oDMSmOxfDT5hWiUgvun5c35bMSwPZKGtO3OZbLfmnVV1KI7KS
         lZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719858824; x=1720463624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o768OFO8ymKF2WN6iJdKjiEs5teokkn43UIghq2x2Fs=;
        b=EDAvktL6O5oN1qBV6nk4bsyRxWa6ClsstmyLNl7hgJUQvpRDGOh5Qj2Xobv6KXYoyR
         zPe/wZo/QtCZ8yEhqSND4MY27hZVPcXvyTekS7e9FvGNCKE7ctiRuQtXvI2b2R/WU7NS
         sXxaT3eZgLA2Lsk6yaP94nZtAdJoMsjy5tK/HAHOLXdNrnEr4vy1nwwmULzH0aBgTq/R
         TWImie30hNc+3pXC7kzfUzSLXlZ90pKmW0boK9Cai8ZQ3iPfV8IT74cvtcDl5cnG7TTB
         mA8p7PRtiwIFpjuCgSAgRLvG7YwlZ64ja1xYysnRcNvTKKkR8uKSwAjuLGbFEaGzQROQ
         b9Dg==
X-Gm-Message-State: AOJu0YxKQJCZx7CBb4nRMyZov602feUeHN0qpgcjwejtDdvq57Nz8+6/
	0qtMx0oZcuvWRxvkGcfG++rFGzLtCprmV7nEHlTyjT0wOGEdU3zyaqxEl10890jI/EskT2NykOA
	j9Je+9W+fuGulTdi7zoMU08Z/pMHauczjeg7NTJ+g0hki0YUn
X-Google-Smtp-Source: AGHT+IFQ9mRosBK5PT0v4bYt3n6ANEe4IwUtPMWvMAL3GS7KvQKxJK01J5Eg8zPyYaPZntVpFAZHwa61OYHF/xeWlKo=
X-Received: by 2002:a05:6512:1154:b0:52c:e5ac:ecd2 with SMTP id
 2adb3069b0e04-52e826feb8dmr4493189e87.51.1719858824320; Mon, 01 Jul 2024
 11:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBxVyEaCFt+bC=bwO54n30urANy+DaffOBk2odpqjpbBgOPKQ@mail.gmail.com>
In-Reply-To: <CAHBxVyEaCFt+bC=bwO54n30urANy+DaffOBk2odpqjpbBgOPKQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 1 Jul 2024 11:33:32 -0700
Message-ID: <CAHBxVyGOiurDC+ep2Rzw0tTWHSWa_tXGA3ftd5JcWm6SznWyGw@mail.gmail.com>
Subject: Re: RISC - V Microconference CFP 2024 CFP
To: linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_113347_035667_F5E5D590 
X-CRM114-Status: GOOD (  10.44  )
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

RllJOiBUaGUgZGVhZGxpbmUgZm9yIFJJU0MtViBNQyBDRlAgaXMgaW4gdHdvIHdlZWtzLiBQbGVh
c2Ugc3VibWl0CnlvdXIgcHJvcG9zYWxzIGFzYXAuClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ug
cmVxdWlyZSBhZGRpdGlvbmFsIHRpbWUuCgpPbiBNb24sIE1heSAyMCwgMjAyNCBhdCAzOjMz4oCv
UE0gQXRpc2ggS3VtYXIgUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gVGhl
IENhbGwgZm9yIFByb3Bvc2FscyAoQ0ZQKSBmb3IgdGhlIFJJU0MtViBNaWNyb2NvbmZlcmVuY2Ug
MjAyNCBpcwo+IG5vdyBvcGVuLiBEb27igJl0IG1pc3MgeW91ciBjaGFuY2UgdG8gc3VibWl0IGEg
dG9waWMgcHJvcG9zYWwhCj4KPiBUaGUgZGVhZGxpbmUgZm9yIHRvcGljIHN1Ym1pc3Npb25zIGlz
IEp1bHkgMTUsIDIwMjQuIFByb3Bvc2FscyBjYW4gYmUKPiBzdWJtaXR0ZWQgYXQ6IGh0dHBzOi8v
bHBjLmV2ZW50cy9ldmVudC8xOC9hYnN0cmFjdHMvCj4KPiBCZSBzdXJlIHRvIHNlbGVjdCB0aGUg
UklTQy1WIE1DIHRyYWNrIGR1cmluZyBzdWJtaXNzaW9uLgo+Cj4gRHVlIHRvIGFuIHVucHJlY2Vk
ZW50ZWQgbnVtYmVyIG9mIHN1Ym1pc3Npb25zIHRoaXMgeWVhciwgdGhlIFJJU0MtVgo+IE1pY3Jv
Y29uZmVyZW5jZSBtYXkgYmUgc2hvcnRlbmVkIHRvIDEuNSBob3VycyAobmFubyBjb25mZXJlbmNl
KQo+IGluc3RlYWQgb2YgdGhlIHVzdWFsIDMtaG91ciBmb3JtYXQuIFRvcGljcyB3aWxsIGJlIGFj
Y2VwdGVkIG9uIGEKPiByb2xsaW5nIGJhc2lzIGR1ZSB0byB0aGUgbGltaXRlZCBudW1iZXIgb2Yg
c2xvdHMuCj4KPiBMUEMgMjAyNCB3aWxsIHRha2UgcGxhY2UgaW4gVmllbm5hLCBBdXN0cmlhLCBv
biBTZXB0ZW1iZXIgMTgtMjAuCj4gRm9yIG1vcmUgZGV0YWlscywgdmlzaXQ6IGh0dHBzOi8vbHBj
LmV2ZW50cy9ldmVudC8xOC8uCj4KPiBVcGRhdGUgb24gdGhlIG1pY3JvY29uZmVyZW5jZSBzaXR1
YXRpb246Cj4gaHR0cHM6Ly9scGMuZXZlbnRzL2Jsb2cvY3VycmVudC9pbmRleC5waHAvMjAyNC8w
NS8xMy91cGRhdGUtb24tdGhlLW1pY3JvY29uZmVyZW5jZS1zaXR1YXRpb24vCj4KPiBCZXN0IHJl
Z2FyZHMsCj4gQXRpc2ggJiBQYWxtZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
