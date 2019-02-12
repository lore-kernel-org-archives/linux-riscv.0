Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E5CC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 21:19:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05FF82080F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 21:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B4FiD5kH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FXcRGjAA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05FF82080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vBxXd565ECsG+BIPhBZHoMCO2jApOiwwKZpL4XHftxc=; b=B4FiD5kHUOq+dU
	TWhKoUyl14MTylkf3VdpPBr8E5gn70N9V5wcuZgcgSYqJNQ8sk149SOPU4zWj2OvvkqpmOwkz2TAc
	tJP0B/Y746jKqETGuKil8UZLRLCdZbhWDnUSUuIkpoi8cWSuvI2LvmAkLDp/4JgSuxQ4PpmYhv+HF
	a6VAtlWZygC7nahHEn5SMJFipiUVETHIMKoSONakbfQy/uaVH2tCIAltgdVgE4BR6vhyxiN35A1O4
	jKn01E4Enjgs79/yjzHpmmtw0Y41b3W7Xr6CroE1ttzOIokq6y4sBdx+V6j/Gy9tYF5uF4waY28cn
	LDqickE+x061FFkiDw/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtfSG-0007LW-Pi; Tue, 12 Feb 2019 21:19:00 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtfS7-0007AB-He
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 21:18:54 +0000
Received: by mail-pg1-x544.google.com with SMTP id q206so66428pgq.4
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 13:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=7jn3J1N45mjFhAjEYdQDoen/Jj3zXV3ffwF+Car7qjM=;
 b=FXcRGjAAnulMtToNJJXzQMHEGVoLr32XFsEK6RHS6woHCvivq4333WrY4mTUCIUrs8
 ms/20OPAgHQYPl6OMTY3EXbB3RxcKwrA6ZZEnSMgAc1NzDML1grF72Zfd6mD9PJpZXmg
 cnZYza9H8rh8rKCG9s/oHRg3TgWaYhsC5H8MnA7kQE0EshnhD+jdhz6svgCxdLDc4fEF
 yJoYhbhOPsxKDmNMFky0VzrU31mXPhBbcb6pAaW/B25yHV+2NA9V7zHhaKIS9yXYBRFa
 HxGyUJD24wY1YTl3iQjOS+GlHQ78hgj2Nf1GgSwlnZo2ZpBAZL5OtXR44OVTtbcu2FTu
 hc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=7jn3J1N45mjFhAjEYdQDoen/Jj3zXV3ffwF+Car7qjM=;
 b=Kbbad1JfxRpneITbT89VH5ESNrrAEY1GV/uElP2N8WP5XUxwImu+CVuu7x19els/KT
 iGBQdWNB3ppWke66zqC2uITHerdpkvI4qozNdJXDQVdD8HqqZko76OPcApBYtUwVMsjF
 pDGyA1s6OnBllX4bWwjjrANNMgAhKW1KXjefZUvt5L27CZ//FzX6kEhez00s8yeRjH6g
 I4xjWNhL65ZbuBaEUdz9SXGTYS9Phz9DYi0zvBGQms2eGN0p1lyPx0oWS8VHQBLuiSz5
 XND9BWqqM4utVBnQT2q6u/i3m8Tn8VWzAmol3H7g8/h+tBtTT9M0GkooEbr/HVdHMV4e
 wPUw==
X-Gm-Message-State: AHQUAuY7jRmrlRajH/KNN5eOYjUGht0W8flZ94kqeFyJX7CE4b00uOzp
 /q+Q6DK8usgoOcx0LVIxwvX2AsWgjfY=
X-Google-Smtp-Source: AHgI3IbFgOyBnuZx9ir/kVuBH1aXHVAW4D1pKnhKZDynCCh0H+XAPi0uXlDUwfsYLN40+xIdXvTtQQ==
X-Received: by 2002:a63:6244:: with SMTP id w65mr5401230pgb.300.1550006330084; 
 Tue, 12 Feb 2019 13:18:50 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id c4sm36770281pfm.151.2019.02.12.13.18.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 13:18:49 -0800 (PST)
Date: Tue, 12 Feb 2019 13:18:49 -0800 (PST)
X-Google-Original-Date: Tue, 12 Feb 2019 13:17:26 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.0-rc7
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-57c6009c-7e1d-4742-af0a-807c08dab07a@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_131851_902665_EF067C17 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit d13937116f1e82bf508a6325111b322c30c85eb9:

  Linux 5.0-rc6 (2019-02-10 14:42:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.0-rc7

for you to fetch changes up to 41fb9d54f12b87fb1f670653e95d34668a08e8ee:

  Revert "RISC-V: Make BSS section as the last section in vmlinux.lds.S" (2019-02-11 15:24:45 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.0-rc7

This tag contains a pair of bug fixes that I'd like to include in 5.0:

* A fix to disambiguate swap from invalid PTEs, which fixes an error
  when trying to unmap PROT_NONE pages.
* A revert to an optimization of the size of flat binaries.  This is
  really a workaround to prevent breaking existing boot flows, but since
  the change was introduced as part of the 5.0 merge window I'd like to
  have the fix in before 5.0 so we can avoid a regression for any proper
  releases.

With these I hope we're out of patches for 5.0 in RISC-V land.

----------------------------------------------------------------
Palmer Dabbelt (1):
      Revert "RISC-V: Make BSS section as the last section in vmlinux.lds.S"

Stefan O'Rear (1):
      riscv: Add pte bit to distinguish swap from invalid

 arch/riscv/include/asm/pgtable-bits.h | 6 ++++++
 arch/riscv/include/asm/pgtable.h      | 8 ++++----
 arch/riscv/kernel/vmlinux.lds.S       | 8 ++------
 3 files changed, 12 insertions(+), 10 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
