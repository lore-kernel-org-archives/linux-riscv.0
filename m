Return-Path: <SRS0=Z71o=LW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFB9C48BC2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jun 2021 01:16:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF5761492
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jun 2021 01:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF5761492
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMAYpmJji80dGTaVyqrJrRDE8cniogJTanO5/1Qq9H0=; b=4U9lN5Io+Jdz21
	IniBP/z5Ki7RR1fkha96uLXFjuhB8Ci2mKHUFF0oI54CCQ3cvmtt9NYzvA7ZR/NRJo221Qo7rhTOf
	rQHtegCSEt/h6CqRviyiFxVXkSFIYjqhWqgx/fDCv0n+flnIweAMeuJGgVxsVNvgKxwpbh0d8S+nh
	Q5Cj7WMIKpu0HpKgxX3TnEhsITkDwCP2uxPvZLp/BFzf5jMM60Wf0uxG14gIJyt6xM3AZZN3LttT9
	eZ0i1e/0AhEewg7rl17qk1cF6jbkL4uBWoNx8EU7Senm4E237ryhtDo/VOxJ2CZhuTbPSRNAXvQl+
	tCKgYQgfmh4qXHWOMcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxfsX-006NxJ-W5; Mon, 28 Jun 2021 01:16:02 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxfsV-006Nwv-AU
 for linux-riscv@lists.infradead.org; Mon, 28 Jun 2021 01:16:00 +0000
Received: by mail-yb1-xb29.google.com with SMTP id g19so4996721ybe.11
 for <linux-riscv@lists.infradead.org>; Sun, 27 Jun 2021 18:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UkMAHfuwy4T4nE/9j7AY6+wibmFtWQXZ1+xqS+q+V5g=;
 b=NiCCYiUWUhiAheTITykpwC+dxbmQnBiVsbXJeWf4dUKX2eI0lZUrhz9lUFWBcjrQGU
 +aWXbl5TV9GdjKY4+9o68L1u694oOKZL/SzN9nNH6Y4N7xNMQeNq6G10JRjDf35D6wTY
 F2rsufzPhXAHmZj0oeKCnUvCWITQrwhoiQ++WLpY/B+ixnOQE0qT7mbZfq0pCBMHDoIH
 iox3aeR24DjoMgweX/+KUATDThgS+IxPni54ORr/uRHhPUMxGpxjS5h2PeuNEuDlZh2z
 TqFiSaZI8B8XEMnVPZkW8mx01MVQQm/oEaaw8i4mX459Fm3hxGHIbfn9llruFHiK7FyG
 lSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UkMAHfuwy4T4nE/9j7AY6+wibmFtWQXZ1+xqS+q+V5g=;
 b=lMDFNvi/ShayrBdfGxxQs/k0P0UdOAERNyURpzYz5pBqdcwuhn9Toc4J1cFbzqr9Yt
 FGI3h7+Qn2eMk/m8F5DCTVdxoMgNadGup0T8f9v0GmAn1Ao5eUwCNFbmq0Tkjbll4Tir
 O+y4i2JD3bACDTHUpEv28HOtH1NszGjL3Lr2Obc93CJ5e93mVnju9zr5g3ZxLrJIv50E
 Nq9bb8e6SMcoUT/NGSp5CIf9nAVw8adiScVCUdD5GvB/6lq8swPd6k5gCrAUSa/ZvPgm
 dill4E2L3vl7Xzzy38DuWvSdmCz1RzEisv/kTA507ZJ3O4nWVjtHtz5NeUpg8dd+gj/m
 l/7w==
X-Gm-Message-State: AOAM531nF6SvuGPjRnbWal7vJEDfta+IsjufdkAq76hKbzer2dM4s98H
 P3txCn2d+WibRCVA04gQkrBwN5zkcr6TmIuuQkE=
X-Google-Smtp-Source: ABdhPJwluPXetY+X6ZHjkQQfTC3XBMX2pKdbuji9mHu2sB5uWOFxPXFw9g3V7NBJI494uGJDv9k0gBK9KL5GAP4zZH0=
X-Received: by 2002:a25:ac86:: with SMTP id x6mr26783670ybi.314.1624842957907; 
 Sun, 27 Jun 2021 18:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210627135117.28641-1-bmeng.cn@gmail.com>
 <11706f7e-a53a-5640-d713-bc4562db71fa@huawei.com>
In-Reply-To: <11706f7e-a53a-5640-d713-bc4562db71fa@huawei.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 28 Jun 2021 09:15:46 +0800
Message-ID: <CAEUhbmV=h3nZ8Aa94_uyjrZ_NGe+9-xAorUMubSPJXu3y60PeQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix 32-bit RISC-V boot failure
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_181559_416680_5744CF47 
X-CRM114-Status: UNSURE (   8.29  )
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

T24gTW9uLCBKdW4gMjgsIDIwMjEgYXQgODo1MyBBTSBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53
YW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gSGnvvIwgc29ycnkgZm9yIHRoZSBtaXN0YWtl77yM
dGhlIGJ1ZyBpcyBmaXhlZCBieQo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvMjAyMTA2MDIwODU1MTcuMTI3NDgxLTItd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20vCgpX
aGF0IGFyZSB3ZSBvbiB0aGUgcGF0Y2ggeW91IG1lbnRpb25lZD8KCkkgZG9uJ3Qgc2VlIGl0IGFw
cGxpZWQgaW4gdGhlIGxpbnV4L21hc3Rlci4KCkFsc28gdGhlcmUgc2hvdWxkIGJlIGEgIkZpeGVz
IiB0YWcgYW5kIHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgY2MnZWQKYmVjYXVzZSAzMi1iaXQgaXMg
YnJva2VuIHNpbmNlIHY1LjEyLgoKUmVnYXJkcywKQmluCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
