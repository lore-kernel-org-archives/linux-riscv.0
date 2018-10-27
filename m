Return-Path: <SRS0=itc2=NH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E06EC46475
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 09:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA3220665
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 09:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYuL4T7t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0EX6bwL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EA3220665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/ndsqnIL8VJW//yahHJwFy/Srfp+MCbJ4dJKacIvjU=; b=LYuL4T7tHGnsCZ
	wsYDPnAOc29vvYo6vFZ3O4DJeCCqgnr/3LNe84k1gnolA8nnwOa9BZsU/cTafr9JnPjL+J/as1ZPS
	pyCP8uMYjMbFyWIt5DqkwrmGzs7HGLpxrm7NSs1kjTxGQmU6ePIaa2+1MthS8GyXSz++F9owh//tS
	+2pibjwW/uhMemL81Uxh8lTGatPhsYr7zhD/3j5Y+CYoHCb9vUWSRB29zN5B8JvDcNucaAbammksG
	oclyiSQC40E9+Dcooxdsfj2WO2LBpXAaYSv/vrlGpj5K0Rlu2DLlQRe3VQsKmLA5RjL+BsR/plNwX
	66YU5vKd+Nx6uE90S+yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gGKcV-0005UK-SK; Sat, 27 Oct 2018 09:10:59 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGKcT-0005O3-35
 for linux-riscv@lists.infradead.org; Sat, 27 Oct 2018 09:10:58 +0000
Received: by mail-ot1-x341.google.com with SMTP id o14so3284740oth.4
 for <linux-riscv@lists.infradead.org>; Sat, 27 Oct 2018 02:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=shLWQupJ6k219v4fX+tZHn2CcxSnWDddNSlw9jXYVL4=;
 b=p0EX6bwLYTsobmc5bsQ0xnVBRnm8Y/rGOBrjCxsmZNjEOUV9gBghMwF8VtUWjTLUrb
 RaPpauVhHVNISrXKfljhlRVDFEZf6D81zkYQx1Btiw3M/XMCw7COrqi8MgOrM3osW59a
 TToK++1MRrHrLB5wVIKvTFCv01D6RNX7ibS/DSwAtQWa7CmaS7Cb0vZU052C71TKPsaf
 fIpO+AMw8wDzNolVNUXvXBF9WKoI5r2+ksYERDI8pDBItA240/evVpmDTVYCeGtGVqxo
 W/IjI341sy0UJ6RQjJfZ8/BuGdPqpsjFqpCkz5XxzFDT9PC9PbZVFlTm+KzFanuF3jrt
 KIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shLWQupJ6k219v4fX+tZHn2CcxSnWDddNSlw9jXYVL4=;
 b=cjucNQZ0pnEgLoLLqWOG4+XC31RVj/GJc8LYbXc2E9eQYE4qaSMFHOEhVR2nigWv4s
 Bk/XygxRy3Bf0QC4k1i2deuMe0gTbSUxMqN0etMjkWxY0P81Aw3kmT7XZBmoJoZZHjE8
 73pubtd+Fyl5bofEXoF9OeLZamMcNcpYt6+TLsQWlu1m7Koh2GaDwyd5Ljg72DLdCQiQ
 jO2H1u5w5bQYogQFfxZ5r1oBhqWY66LYsICPKASLNykV+SuxuIDcYb6YhwyWZwk8UQ8X
 2LaRSN7AzPakq4xPl0PofWNUEgekolSOdjwDNR0erwfLbOipPo+meQknF9QGt0rF5ZfL
 0B0Q==
X-Gm-Message-State: AGRZ1gI00MNpqkO9rzdQhGnFhhJ2BkzeNkR67qvfOUSzOKfZyw/6SzC9
 e31CijLXCh+Bf1pKvsRBsTz1gmYJUOi9UTR5kfs=
X-Google-Smtp-Source: AJdET5doNGyP5Zzj2XjDI4OGuGSyQOweGk7NtpKogeYCNaKuQa8wLDRMeh2uD/xNjr3hweMWJ2/pcD5KazvOJHTb80I=
X-Received: by 2002:a9d:7383:: with SMTP id j3mr610274otk.117.1540631445622;
 Sat, 27 Oct 2018 02:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-2-palmer@sifive.com>
 <20181027074613.GA7868@infradead.org>
In-Reply-To: <20181027074613.GA7868@infradead.org>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Sat, 27 Oct 2018 11:10:34 +0200
Message-ID:
 <CAEn-LTq8i4FFU15Gn_zm_mwUzgp6i5dGCgKmbXju9qwBny+QhQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Move EM_RISCV into elf-em.h
To: hch@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181027_021057_182057_57E95E2E 
X-CRM114-Status: GOOD (  10.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, aou@eecs.berkeley.edu,
 Will Drewry <wad@chromium.org>, Paul Moore <paul@paul-moore.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, gregkh@linuxfoundation.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 eparis@redhat.com, luto@amacapital.net, dhowells@redhat.com,
 linux-audit@redhat.com, wesley@sifive.com, linux-riscv@lists.infradead.org,
 tglx@linutronix.de, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181027091034.FJtbLJBQuzK0AWGI3dgB-WdFoMHPOip9SDN3UCSINRs@z>

On Sat, Oct 27, 2018 at 9:46 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Oct 24, 2018 at 01:40:35PM -0700, Palmer Dabbelt wrote:
> > This should never have been inside our arch port to begin with, it's
> > just a relic from when we were maintaining out of tree patches.
> >
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> Looks good, and probably harmless enought that we should pick it up
> for this merge window:

That would be nice. The audit parts I am working on depends on this patch.

Tested-by: David Abdurachmanov <david.abdurachmanov@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
