Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7CEC64ED6
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Feb 2023 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w602+mGTKFieHAoa7EmAU7oYNwMPd+7FZ1W3lz4JxGk=; b=G6px+aYCNz+mRd
	4ozBdmPh/8osbQbYDcZgVPELam7HFUVkDU5zY31dZ+0shVp7pJspS7daBavVhlKR6qh893Ur6T7Rf
	zNrsdnMXjmmIFuPdCAFN6gybHotjH7pAaTZGOlTFl9QrRpCjJUXQquaZawcQkeOr2+w8a6JMHZGEf
	AIYMOdN+6oUpaOQWX0z2mM0kY6YVXD3gpRxqGSUy+Ryx6DVjDhYrdidu4OSPEqn4H76kEZGVi+1hB
	pOkMWlNLOIxFM/Vnwol1ARcTE0oSacNRV7TL61duEZqObJhOMqklDDB0tCbqxO4WXdS05WO75Nio6
	/Gw7v0lwyS688hr/rmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIXX-007UhA-D9; Sun, 26 Feb 2023 15:02:15 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIXS-007UfI-2n
	for linux-riscv@lists.infradead.org; Sun, 26 Feb 2023 15:02:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id t11so5363834lfr.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 07:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=00BrJtQYUm2ctanqeELqxST7ownlOAdQkcEkYX1TRIY=;
        b=DNtNgHrKHGXDrwr0dIP1O02KBWNU47s76Dn5SZDAb6npnbDtIsEz+mG0/q+/q8ZXvp
         JhwhVmePdBDUiYTFoluF34vUTAT1Xkia/4id2ET6dSqcD6DYeZR5doLS0XBCH0HhPNUI
         +M4PjPkoe1xrs6QJkY+MLyskbQZ+AeZMRoyM8sWVd9XzjkEQsqCZK61iS8PLEPOkPY3Q
         sUfaAXMxzCA6tn02IrcfmaQsprjTwQDTuzw3O8oN+jOtT+B/k33erSWdkJqG9Ar7CCxi
         GKAqqcnQ4H+ul7vKeu+UB6RiazneG1GS+KvcWbKNEvXSL+pKzy/txhmacIG6YkFWrvSW
         HWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00BrJtQYUm2ctanqeELqxST7ownlOAdQkcEkYX1TRIY=;
        b=ElCohiEbR/sENKOdLViPSDAYDNmihn7Ds9HHwdNoQtQSAV9qRGRkt+pNR29+4SsZ0V
         6pCgKcIHAPgSCBq9pwAUrRQgOm1RKFyCCXLlDCvIUisHa7iSN924yFebFyk/h1McZOxW
         ysWRkmiL12boEgC3U2y+wgO8MpJgf+pSlqAGTzPd0nu/hamEyEX0gqtDvyG5taxb8g8B
         XHPIuAGB+prlZRa7KnDpoDfFroiGp5IQFIvLN4zLyzCw6d5bNzEv6FJnaHKu9VswN7eV
         sz7a9hTbuovnQzMRnn49SisQDtbgv0qBP/YRT+RMJHirsfjbN+rHT2mjSe1i1L9vMqyT
         bGrA==
X-Gm-Message-State: AO0yUKW66xgiQzNprpyK5b9F5tHzf25odru4y1NYvZsPauOAA872ZlZ/
	xI8La/Wum2eijyu3/wRIrSbEkeSmwd6X9444hvU=
X-Google-Smtp-Source: AK7set8F9McGCBvWUbZ8pqypNd9y272tlLBLu/PzUd1t2mSBj/bDCrHtHZv9kX6OSJHVK/frmc2mTA==
X-Received: by 2002:ac2:5383:0:b0:4dc:4c53:4460 with SMTP id g3-20020ac25383000000b004dc4c534460mr6907072lfh.16.1677423720441;
        Sun, 26 Feb 2023 07:02:00 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id z7-20020ac25de7000000b004db44dfd888sm580715lfq.30.2023.02.26.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 07:01:59 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Zong Li <zong.li@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH 0/2] riscv: asid: switch to alternative way to fix stale TLB entries
Date: Sun, 26 Feb 2023 18:01:35 +0300
Message-Id: <20230226150137.1919750-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_070210_166272_929DBB99 
X-CRM114-Status: GOOD (  12.14  )
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

Hi all,

Some time ago two different patches have been posted to fix stale TLB
entries that caused applications crashes.

The patch [0] suggested 'aggregating' mm_cpumask, i.e. current cpu is not
cleared for the switched-out task in switch_mm function. For additional
explanations see the commit message by Guo Ren. The same approach is
used by arc architecture, so another good comment is for switch_mm
in arch/arc/include/asm/mmu_context.h.

The patch [1] attempted to reduce the number of TLB flushes by deferring
(and possibly avoiding) them for CPUs not running the task.

Patch [1] has been merged. However we already have two bug reports from
different vendors. So apparently something is missing in the approach
suggested in [1]. In both cases the patch [0] fixed the issue.

This patch series reverts [1] and replaces it by [0].

Regards,
Sergey

[0] https://lore.kernel.org/linux-riscv/20221111075902.798571-1-guoren@kernel.org/
[1] https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@gmail.com/


Guo Ren (1):
  riscv: asid: Fixup stale TLB entry cause application crash

Sergey Matyukevich (1):
  Revert "riscv: mm: notify remote harts about mmu cache updates"

 arch/riscv/include/asm/mmu.h      |  2 --
 arch/riscv/include/asm/tlbflush.h | 18 --------------
 arch/riscv/mm/context.c           | 40 +++++++++++++++----------------
 arch/riscv/mm/tlbflush.c          | 28 +++++++++++++---------
 4 files changed, 37 insertions(+), 51 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
