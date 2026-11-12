Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC5606A330
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G7R3p4Wh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhPbTrDF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Z2bWVLPQOeIgeLLfAmWazaSIbSMYdyW8bU1w++kYIhw=; b=G7R3p4WhbQi2DRBhP3TxtWz6Cx
	JV+HM5PYW2IoLP8sn/RFADUggbC5METArRs5ctjUiuNEHJMgU7SMufi3x5HJTCPHYRChxuUzAhGJP
	VJiwN+/A/wYITq+rAEVbVDBX2f7NlUuVWotl2KJPo2ncahQZ2DAq4U8cyDV3otSYybMEZfKeLKx1T
	iOb+NPmH1uN/wAX634VavJc+zr8+abmCyuePx1sigY7m9O1b5mm2FDPP52wO50iBbPPxmhb65K3n1
	L6sV7XWiSmokZZofrc0OtpNjIa8MT82yQeb8Hh44dsLPPKGputtdl5cPKCpyRD/y7Ys8s1iarxP+v
	ko6zPzkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV4L-0000000A7mt-3zxJ;
	Thu, 12 Nov 2026 13:42:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV4K-0000000A7mc-48rm
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 13:42:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B21C60D4A;
	Thu, 12 Nov 2026 13:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599E61F00A05;
	Thu, 12 Nov 2026 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490944;
	bh=GQHgVl+ihyM808NJI/QLfdnJArapHyJNzZCISd5OzbQ=;
	h=From:Subject:Date:To:Cc;
	b=lhPbTrDFNBESSdw7RB77EgLeLRSKn5Am3YuXHmEbfAR+08//MYeB2W0em10nXm8eM
	 52cWEXS15V2hgIorhB9XNcgw6eHv78caUrV9hAJU2PwBVlELq2AF8iC/5rsCGkLX/+
	 SzvHZYq9GofFyxxXXI946+AUJaj50fnotH0lYUcnViLRONINxdSDUJqx9HKhwD4DjB
	 lF5C/c3fZRHeugZ8dNJEfoyRX4SNNqhN48KWJ76/VzldYJ/d7goChCbZHHUjpvwsqJ
	 ELHdHJcf8zgvLDS6QayI15+54pbWp5/RD3T5/5EeodBpbBvZ/fnrwfkCH3CTLHANK8
	 okZDqmTDsmSDQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH 0/2] riscv: mm: fix set_memory_x() and
 kernel_page_present()
Date: Thu, 12 Nov 2026 15:42:17 +0200
Message-Id: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSw7CMBBDr1LNmggSfhFXQSyS4LSDRIpmSoVU9
 e4ksHy2nxdSCEPp0i0kmFl5LBXspqM0hNLD8L0yuZ07WWudyfyBGmFNs9nj4M/e56PPoGq8BL+
 6Ctfbn/UdH0hTu2iLGBQmSihpaNEo3HPZPoNOEFrXLy+NU0aPAAAA
X-Change-ID: 20261112-fixes-riscv-3e48788f58fe
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.1-dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These are two riscv fixes I found while working on a generic
implementation of the set_memory APIs.

The first one stops set_memory_x() from making the linear map alias of
module and BPF text executable.

The second one makes kernel_page_present() report the pages removed from
the direct map as not present. Today it says they are mapped, and
hibernation could copy them without mapping them first.

---
Mike Rapoport (Microsoft) (2):
      riscv: do not make the linear map alias executable in set_memory_*()
      riscv: mm: check the valid bit in kernel_page_present()

 arch/riscv/mm/pageattr.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-fixes-riscv-3e48788f58fe

--
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
