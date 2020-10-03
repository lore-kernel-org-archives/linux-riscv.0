Return-Path: <SRS0=eDvz=DK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B7CC41604
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 06:38:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 107E7206A5
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 06:38:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QadSlpVv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="MR2S4uqJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 107E7206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6TYHLzvW6vu0K6tDKrFpPGHTcDNbhCCDYIkZxhwdtRA=; b=QadSlpVvEcwd9EzDAJ3XONzFd
	Xt8UnO9JqVDIeANuO0mJsxwzcIcuIaSkYELHiD0Gdn6aNNVVbsHpkE7hJFL42fq2mbtDcltOUuU0q
	fDhbQEa/khkrk4fYb6gutPGLMNltInwpXL4GeG/doCxbVtttZlLYSO6LjbRm7Aw4ew9uQxUtLpcL3
	iYfarHTEUTi/zM2mUI+xMVGqFgfg0osy0m/CXHOHT+Qc3DoZFySR5qigPC/ztFzZlYI5NM5pe5ECA
	M9D2Wq9WKedClJlQDGjCMLkncORrGRqWNFNSr6vLsuHBzWJMunMbKclccbkPy/ECEMj0P/Zzzo6BZ
	D7Cc6sOBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kObBL-000800-DA; Sat, 03 Oct 2020 06:38:11 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kObBI-0007xf-IF
 for linux-riscv@lists.infradead.org; Sat, 03 Oct 2020 06:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1601707074;
 bh=md0r0m36JBviEhAlMywLuogQp9PqQBA26y2UxZb0WKw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MR2S4uqJT6zeEuMKunqAU8seXGD3k5im+o8JRx+AyzgzgMsGEcD8Koam5EqTpkEGi
 DKl47rQfF9z5WXK53+nFUAmNArPXCRTUC2t3//VRvzA8D8LcCTelrot4I4Ffhurubz
 HJYsllbeYRAS9/3sJ1z43gqo076pqTEp8G1Md0fE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([178.202.41.107]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MulmF-1khESP2Q1j-00roqy; Sat, 03
 Oct 2020 08:37:54 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 1/2] docs: admin-guide: fdt and initrd load in EFI stub
Date: Sat,  3 Oct 2020 08:37:24 +0200
Message-Id: <20201003063725.8698-2-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201003063725.8698-1-xypron.glpk@gmx.de>
References: <20201003063725.8698-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:GPrLsj9lxvHLBZU79XBKoGh3Tqybvf/pk+6ebZSYKfl9LsWZe9M
 BCkoXUBoP42pRKZvaX+A+f7GpZGLX8NUkJ00fdbt2e/rt22sk+FwjNk9mtxZSRZFSn5F4rw
 8+ff7EHNinTQyOmdS5699oVnFYj+nzycp57KzC3APNGuh9q5SlCZlj5EKYdAE3W/4+AFaAZ
 VTNluNFlCUWY/fn2r0nNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LQMjD0Ttnxc=:yjwDY+VJpjraaTbaIxLNtR
 UhWnTe+z00u8DzzGXQQsnF4y56JE6nS6AHEu5UXA0KG/dj2lEhhYzKP+Dw236eAMiT8gdU5aM
 IRhTjAz1HXwbOgL/Sc341q6i8M8nX9ctxs/eDdgU6np6kxjx8NqzQw5OaOEf6aCSI32mHa3C0
 0lBj3r7iE5HO06W4ptJlCknGUA/bLpo7ceA+zFT2tSpLPI8NKKZ+S8c/BwH35/4g6vhj5+ZIo
 7iFsNLg9a4nTFEojiXoUvcyrQ8nQScHF43GTN7fQcxc1VY65hC3Tvmn3kZKHA+AxlOG7Byb9S
 aU2otWbLiV/fL5aVsqEUbJD5Z1wZTlg6DfNAltfdbJUl0IAGTklrrek/jz+ryUHFk0Vor6kJh
 rKnHDOnw7bK41vQ63FtL7F6z5dFYDxK+5lGNRwqHfSXA+iCYXJaUK2upbQZ1c9lmYSnJIuWIa
 Hf0eR0cb3DSx154wHWndA9GVcPi2GosvYxAFxlNxsg0VVpsrDchK4fDi5qc7LdaK4zIt9IG6q
 TRQjtM6/qXxTXLsn3gC7Sk75Inq61EiqNtz/bZNQt/77dqKCcz0KsNQ2cO56VnNSPtvu2spE+
 V87zC9tE4VrPjzk0Wff1fFbMCb0kZ1dGLdzmBk76VnTFw//5ec63sH+sx/5l2PXtAQvz3m6S3
 LLiguBkWxlpX7pWvBcdkhEcplkbey2DSeuUal7s9uus99tU6cB6oHNNzIEZLsp3fqBevc+2tD
 GM0qk1c/EowmDEHGvk9XgHROXokWkMAW06pu5EpSVw1UzFP9kEWCo6zRl1sDfPj/MzlyT2n0V
 b2dCDRN96m9eWqTHGA51uhlX8BAqYd1gGWyr87IIUiceE+yW1Uj9+k7SkZ0rCjSZ2X2qQqT2U
 sHHUQrPHob3m0OmdpaZWkpDhRKVBU5dLrhnglFz8WxfbC/bh71kCiQ6sAY3dreVs8I9c3jMn3
 LLdYXsaTRTlHNazd6aaD8ugUnbVFXjqQ66Q1liVC2X4dzX9ptmDqh0RCPOcQPGfDE/st22aEt
 b0GN+5vJw0YBAfRoqqKxwwQmY9nE8jXqTjvm7zH9Bs2UB6TWAiDjwCxe6+FmwhHU4OW0wfnVl
 mj9MLhGvHeCKbndMntW6Vt59HWgVNkSnavEiiglQMjhkiNMqFZKJ9aojAmobgCzoVNYvMtJnc
 ofkekeyvD+sujIRySDwewAiapDtnirTEGN5UOELsCaA7GSNwTAbDiEirwLS77Jjbwe4Qb2yVm
 cUV0sj1rMxiFjnkuJVBHBc1z6HxD1CRxaIIkAhQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_023808_821101_C2513658 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: linux-efi@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 linux-doc@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Describe how a device tree and an initial RAM disk can be passed to the EFI
Boot Stub.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
v2:
	mention EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER (thx Atish)
---
 Documentation/admin-guide/efi-stub.rst | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/admin-guide/efi-stub.rst b/Documentation/admin-guide/efi-stub.rst
index 833edb0d0bc4..4965dec48af4 100644
--- a/Documentation/admin-guide/efi-stub.rst
+++ b/Documentation/admin-guide/efi-stub.rst
@@ -38,6 +38,34 @@ arch/arm/boot/zImage should be copied to the system partition, and it
 may not need to be renamed. Similarly for arm64, arch/arm64/boot/Image
 should be copied but not necessarily renamed.

+Passing an initial RAM disk to the EFI Boot Stub
+------------------------------------------------
+
+The following means sorted by decreasing priority can be used to provide an
+initial RAM disk to the EFI Boot Stub:
+
+* The firmware may provide a UEFI Load File 2 Protocol. The stub will try to
+  load the RAM disk by calling the LoadFile() service of the protocol using
+  a vendor device path with the vendor GUID
+  5568e427-0x68fc-4f3d-ac74-ca555231cc68.
+* Next the EFI stub will try to load the file indicated by the "initrd=" command
+  line parameter if CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER is enabled.
+* The prior boot stage may pass the location of the initial RAM disk via the
+  "linux,initrd-start" and "linux,initrd-end" properties of the "/chosen" node
+  of the device-tree.
+
+The first two items are inhibited by the "noinitrd" command line parameter.
+
+Passing a device-tree to the EFI Boot Stub
+------------------------------------------
+
+A device-tree can be passed to the EFI Boot Stub in decreasing priority using
+
+* command line option dtb=
+* a UEFI configuration table with GUID b1b621d5-f19c-41a5-830b-d9152c69aae0.
+
+The command line option is only available if CONFIG_EFI_ARMSTUB_DTB_LOADER=y
+and secure boot is disabled.

 Passing kernel parameters from the EFI shell
 --------------------------------------------
@@ -46,6 +74,10 @@ Arguments to the kernel can be passed after bzImage.efi, e.g.::

 	fs0:> bzImage.efi console=ttyS0 root=/dev/sda4

+The "noinitrd" option
+---------------------
+
+The "noinitrd" option stops the EFI stub from loading an initial RAM disk.

 The "initrd=" option
 --------------------
@@ -98,3 +130,6 @@ CONFIGURATION TABLE.

 "dtb=" is processed in the same manner as the "initrd=" option that is
 described above.
+
+This option is only available if CONFIG_EFI_ARMSTUB_DTB_LOADER=y and secure
+boot is disabled.
--
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
