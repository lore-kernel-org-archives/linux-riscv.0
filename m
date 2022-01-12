Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746A5C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jan 2022 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4RWiJkxQkC9TMCManOy1RYjN0azw0F2m7gwmQi2s/Po=; b=az4
	5F4QXMKwenSlPrJ1JWwp8yr8XNDU0a2Xwq2kwy+WRxkZdujREM880T2Q9E0yW5fv3raiuAzDSMbSe
	QCbF20r9LAq/vGLyICFMEbx6ocaXIuK+wt28a3q8ef1yo47Txs2ZiQw25WUk570QSvpaHdXX/dXIJ
	OUlOC9W9BxsVxY0tBW5h4ziSGoEwc8z1gHX76/yjcsDQuBVUc1Sz5hDgQOqLf7NO/WgJs/ZEq5Ou4
	pMOMuQK+16lqFZ7reOtNNRQpAx/0KQYJIx8nvdmzjkutl/HrItsKDKo7ZJ8y5v9e6fA+xbwgLrDZR
	TsY+KpgYjMznsJ7qI9FKeJ5/o3vJ3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ibF-003V4K-MZ; Wed, 12 Jan 2022 18:43:57 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ibC-003V2l-SM
 for linux-riscv@lists.infradead.org; Wed, 12 Jan 2022 18:43:56 +0000
Received: by mail-ed1-x52c.google.com with SMTP id a18so13607927edj.7
 for <linux-riscv@lists.infradead.org>; Wed, 12 Jan 2022 10:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=YesSR5lbXgsdLPQI0JwZdiKxMNDUPbKbscacUcb47kE=;
 b=yF/HxGti1hMKlBBG0NAXvBHxjX08sXT8y2ufgmS5Qez3Jo1fJEsIWDTP76zSdmH5/5
 bXTCDg7LQkX5HzZTrj7wRmtKQU5/AH6OXId8v+su10YrGdhHlNmc63anDx23TZ6kAnMV
 8HNeNOtudKhVa+iwfA0bLV1QdhXGx3Q7ElkxVyfjdbQ1MjV1dI6NyldFGT0NitHoReG1
 Vck7mqeyklDoLPCW+EH5k8jQBiB9r4uzYctrI5Xqr7d585zHba6tXna+Xa4AFjx2pB6C
 2dp9feRhC2m6Xv5Gi9M8ituCQtH1sNBmeTKwiVxQGTntJ5+69kxxiRecR4ntwSrEPFO/
 Xidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YesSR5lbXgsdLPQI0JwZdiKxMNDUPbKbscacUcb47kE=;
 b=AdD6GTE4FdjI1o+aCqmNPLeIkVbgTACbjAn+YhN2pIM3N4NdlQjBf7D9kq2niD4b8g
 294JoT3LSOdtJZRubutyHeg+FUrzGF/sbBSZUlHtdPpXbLC7G9p/DIcDHYLq1N33zcP0
 2uu7OuRc3nxYEq7g5pNgcTD0yx4Yhh+VZq9dfuKBZHU5FQcfH6sX6egUImOoxyTVRjU4
 +QyZmOTi8Gq8qzJiBK3tApPZtJdCPRQn/1dOsEdgqU9XJwKGy9ymI8gnZYvFvNDn4dMR
 MlYfee/WPlpyMM2wLrCzCQ26+IFlgEA6iYkFpXzLRDbUFsZekhABgc2R9P3cG1mvKALr
 Dsyw==
X-Gm-Message-State: AOAM531DSZ/iBcyiSPPQFpMrs7LUW4M+Irx8FGQsq9SfBNa0utJo+iMZ
 OUqB7ws3nAKlwa58zRZCBbbnavYTLnUgDCzUHuiZhNSjH6ibwQ==
X-Google-Smtp-Source: ABdhPJxhBICPno6qrCeT0PkqwbYR6GgOeKak5vJSyZsks44As3Jw/n7mOqcOS0WYtVKO7LmO/u1glUDwf8rsK/l8O8c=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr891479edd.292.1642013029698; 
 Wed, 12 Jan 2022 10:43:49 -0800 (PST)
MIME-Version: 1.0
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 12 Jan 2022 10:43:38 -0800
Message-ID: <CAHBxVyHsJkDQB=4o1hCjy2MRs6J4R6n6+XS3bT1iCA+6Z9NGqQ@mail.gmail.com>
Subject: Public review of Supervisor Binary Interface (SBI) Specification
To: tech-unixplatformspec <tech-unixplatformspec@lists.riscv.org>,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_104355_004645_11B3148C 
X-CRM114-Status: UNSURE (   8.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I just realized that the below email was not delivered to unix
platform mailing list and
linux-riscv mailing list because of the attachment. Reseeding it again
without the
attachment. Apologies for the noise.

-----------------------------------------------------------------------------------------------
We are delighted to announce the start of the public review period for
the Non-ISA Supervisor Binary Interface (SBI) specification. The
SBI specification is considered as frozen now as per the RISC-V International
policies.

The review period begins today, Monday Jan 10, and ends on Monday
Jan 24 (inclusive).

The specification can be found here
https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v1.0-rc1/riscv-sbi.pdf

which was generated from the source available in the following GitHub
repository:
https://github.com/riscv-non-isa/riscv-sbi-doc

To respond to the public review, please either reply to this email or
send comments to the platform mailing list[1] or add issues to the
SBI GitHub repo[2]. We welcome all input and appreciate your time and
effort in helping us by reviewing the specification.

During the public review period, corrections, comments, and
suggestions, will be gathered for review by the Platform HSC members. Any
minor corrections and/or uncontroversial changes will be incorporated
into the specification. Any remaining issues or proposed changes will
be addressed in the public review summary report. If there are no
issues that require incompatible changes to the public review
specification, the platform HSC will recommend the updated
specifications be approved and ratified by the RISC-V Technical
Steering Committee and the RISC-V Board of Directors.

SBI specification is non-ISA specifications and will evolve over time
with new extensions as long as they are backward compatible. Any such
proposals for new extensions can be included in the future releases
after proper discussions in the platform working group meetings.

Thanks to all the contributors for all their hard work.

[1] tech-unixplatformspec@lists.riscv.org
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/issues

Regards,
Atish Patra

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
