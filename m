Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC1FC47422
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 06:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zo3hdf1RkCbdVvRKTzaOjLhR0b2B4EyW4rbbPa/Wi0k=; b=m0isKBCc5n9WlM
	ML8wjaaQp41SYoj/lFnlCxZOLCN9ww7aDSplBVPNx5T3KOepQKN2CxZgo8ChXYnBKUxltO2dHU5Gr
	XuqcGbn/r5d/qW7i37i3+1VbhasHRX39hHc3lJhycKsN0I8Q+ke/H3hIg9T5Y85Ze+B2Fv0jucm6s
	rRUZZLMC7RDCBK23P6ejN5nFICAV75TaGi2gyWKEFteFsPiX7HIMIRLFM9PQsaf2/wkkFinAtk1Wh
	pfpWwboMoP0gY/U7JT/ElbM21KgsO+hspQX1fFpBp90o8jTCdhFb0vr1qjV2xuIoyGaNh+0NjJ1Pn
	SSdsm0LMvAh4ca+gogyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSWXw-001hdK-1L;
	Wed, 24 Jan 2024 06:15:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSVaW-001WzB-0Q
	for linux-riscv@bombadil.infradead.org;
	Wed, 24 Jan 2024 05:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XGJ4xzKEBHQCL+Lx7EHmlxoam/nGU3dZpz0/i2oQX6A=; b=AxNWtYkLFm0U+mZ9yZwjUQFFt0
	qHGlOHgG5ijCFccBuCHKrRnLLMjgwpFbrvQ1OtIdVEFWgxWYolQL13Lh7Daz9mR6xrXQ8P/YZByV8
	svH2tVz4IR9vBTbh7oOX16OFNLjZgUhRxWQcyW45r4ViUtq91hok2OJz2D09HJSFhqGRKf2KICGOM
	yVxcaCZf8/Yxh/N1QccOSnmEzTow4q/nq2WG226y6DLpGrgrYBivHwjt4UnuCN5V/yG1OeO5dMlDf
	7PjtliJRl+WdzBUN8P9tGSQeBMuv9zpzw9Ty/xZWkVThOZuFhaE9VcBAcxjCCBy02RY8doJuMOqT4
	gYDvmlHA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSVaS-00000004FJQ-1dOP
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 05:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706073246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGJ4xzKEBHQCL+Lx7EHmlxoam/nGU3dZpz0/i2oQX6A=;
	b=IoEbuqCcYvZsVlJpdY52PcfAim9/O2XKBKL8VGYLpzfk0BcVXC6G7WPSC8v3NF8AXBzri2
	8TCzCKLKyy/zpIvp4bkLbWtVHui/7PUFSNreXk0y9YiHgQ6BYikl77aB9n2f5TiKhUt2tX
	r4zrjcutG8Q3MSGOvzoFpy/MZYOafCY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706073246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGJ4xzKEBHQCL+Lx7EHmlxoam/nGU3dZpz0/i2oQX6A=;
	b=IoEbuqCcYvZsVlJpdY52PcfAim9/O2XKBKL8VGYLpzfk0BcVXC6G7WPSC8v3NF8AXBzri2
	8TCzCKLKyy/zpIvp4bkLbWtVHui/7PUFSNreXk0y9YiHgQ6BYikl77aB9n2f5TiKhUt2tX
	r4zrjcutG8Q3MSGOvzoFpy/MZYOafCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-mzXdjdWzM6OsVmH87hSpMw-1; Wed, 24 Jan 2024 00:14:01 -0500
X-MC-Unique: mzXdjdWzM6OsVmH87hSpMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1D2C185A780;
	Wed, 24 Jan 2024 05:14:00 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 367081C060AF;
	Wed, 24 Jan 2024 05:13:54 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	akpm@linux-foundation.org,
	ebiederm@xmission.com,
	hbathini@linux.ibm.com,
	piliu@redhat.com,
	viro@zeniv.linux.org.uk,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH linux-next v3 08/14] ppc, crash: enforce KEXEC and KEXEC_FILE to select CRASH_DUMP
Date: Wed, 24 Jan 2024 13:12:48 +0800
Message-ID: <20240124051254.67105-9-bhe@redhat.com>
In-Reply-To: <20240124051254.67105-1-bhe@redhat.com>
References: <20240124051254.67105-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_051409_083041_BFC3CA10 
X-CRM114-Status: UNSURE (   7.12  )
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

In PowerPC, the crash dumping and kexec reboot share code in
arch_kexec_locate_mem_hole(), in which struct crash_mem is used.

Here enfoce enforce KEXEC and KEXEC_FILE to select CRASH_DUMP for now.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/powerpc/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e66fd9923250..31f013e636e3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -608,6 +608,10 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 config ARCH_SUPPORTS_KEXEC
 	def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
 
+config ARCH_SELECTS_KEXEC
+	def_bool y
+	select CRASH_DUMP
+
 config ARCH_SUPPORTS_KEXEC_FILE
 	def_bool PPC64
 
@@ -618,6 +622,7 @@ config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
 	depends on KEXEC_FILE
 	select KEXEC_ELF
+	select CRASH_DUMP
 	select HAVE_IMA_KEXEC if IMA
 
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
