Return-Path: <SRS0=1BHW=GG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B31C433DB
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Jan 2021 10:12:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E46942080D
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Jan 2021 10:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E46942080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qzOpVXZRUDzT13ENxwG/gnFsZBBza/PtNwEQIVcNaWk=; b=gt5fMUhDW5Mwi71oiHr99A3TW
	CVATA+Sg7TQQ1y7U3gqTuItX+DTdmG/Sw1sHqrj3r5fwX7QgDwNi06N7zyWezLOaU3scRJlcyzsUW
	L2+3YxW/MYF0et2zal/XOZzQdx/udluzWZ9gb/O99kABSSTU9GlFjaH38vLGH+c/IotpXDs0XzH/D
	UpT8KQ86oGj1ezM4WfM3DsG5dMf92gvUCoMVKIUYJluBU40FwlTochezhjKE1PIU3/czl8lXFTvEC
	Hx0iefIhNoDKh9a3W8c2bONIrs3WPcfyIzEN5xnDNglk4HjJ4oY8/Kn6D6/bnAT+ah95A3SFYH/8M
	2i62IfvCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw0Mg-0002Ss-Lj; Sun, 03 Jan 2021 10:11:58 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw0Mc-0002SD-F8
 for linux-riscv@lists.infradead.org; Sun, 03 Jan 2021 10:11:57 +0000
Received: by mail-ed1-x529.google.com with SMTP id c7so24232533edv.6
 for <linux-riscv@lists.infradead.org>; Sun, 03 Jan 2021 02:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L8zc+Hq2WA1BSA4ok1MpCWxUZ6tLQD6JKTFLYm6lrhE=;
 b=jMYWm1FFOkqoQcpOCbSVg5+nFpPYq+vqHQ6QzgOAwJe7753Sw+ZNrYfHPSPM07Mh2V
 tHLW5fv8fiKYjZEo3kOZv15snm65SRwnRhUDq8JOTrqZm11wkpOJyzBCxzMxwbdqrd6q
 zE5Wluvp+ZxchFTMoPLZ5YJtAycnwAnNayCLLWYJ4wsHV6985D609TuCJGNt2+bS9w0i
 GiQXTaUTyP9s0SVwlYJZrUKY20YY20Ykmf9PD4pWOdan+lO8BRKcAO9QIiF7tW7rJpqS
 f3Rdosl0gNWbfem8QzJUuTDSIHcr2dqSr3RYT5u5U9CVFsztN6qJRM/2GIqf4S+yw4d0
 Lj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L8zc+Hq2WA1BSA4ok1MpCWxUZ6tLQD6JKTFLYm6lrhE=;
 b=HiCm0vqIjzcmVRc6WlLvyBSd8CBXCoB/Ohid2aeK+Y+aQA1bXX17dHxzw6ZE7Q2y/X
 O9PgHRrUKd95I7PGnz4+T+f35OWVZjtPVGchePrlBuvDxQFGOxKefYZ7kBpBPZbTTuPg
 N/gVtjUntpie3uhrcxp83lO88UHZsgHBYGZetnCWJdsSeaZS9eSQRfwKLkKKnOotU2If
 YoFVEeeHNSri66biGe8V1bW3ktFH/VFedFQb6xvhiJ9y2047yxpIEAFmNgoZnIU6s+yG
 O2ogyRFOinyi9m3usjL7mMFRD9fdoNxMCVQ0qb7Id/0IYCVdD6imY5xm+lcBLnKWrWTy
 Uojw==
X-Gm-Message-State: AOAM5335RhPRtoylQEfGvdGyJD3gb1EvVVcC7eQDCq1DkihqBxO+AADm
 i20lhTq+9nWGXu3/p54swj1TIUtuwJg0Awr30dk=
X-Google-Smtp-Source: ABdhPJyjc4wxyuyr5DpVrBvoavb8dgO6FNjz6ZjtDREOtcytq2OneIKiL94S+FJHdVO7UDi+Jz+Q3EUnQr14pbMQoyk=
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr67681244eds.32.1609668711489; 
 Sun, 03 Jan 2021 02:11:51 -0800 (PST)
MIME-Version: 1.0
References: <1609593874-64422-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1609593874-64422-1-git-send-email-guoren@kernel.org>
From: Pekka Enberg <penberg@gmail.com>
Date: Sun, 3 Jan 2021 12:11:35 +0200
Message-ID: <CAOJsxLGwdrw6t665+Q8k5o_2P8y7fxNV3s_SpQLD_toPg8Db_w@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixup CONFIG_GENERIC_TIME_VSYSCALL
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_051154_709093_CE52C188 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Vincent Chen <vincent.chen@sifive.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 2, 2021 at 3:26 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The patch fix commit: ad5d112 ("riscv: use vDSO common flow to
> reduce the latency of the time-related functions").
>
> The GENERIC_TIME_VSYSCALL should be CONFIG_GENERIC_TIME_VSYSCALL
> or vgettimeofday won't work.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Vincent Chen <vincent.chen@sifive.com>

Reviewed-by: Pekka Enberg <penberg@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
