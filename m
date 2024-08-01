Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEDBC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 11:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=st/lnUXjfxWlH0UtbKfRH4YmFKsqlasmfxNJDVSkS8I=; b=nvqsCsQwOTV12g
	9I2dr/P1y5zV2/EUf9qIwIS3PRWJyf3ftMLYQCmCdQm2xPqN0roy39hxRL2Kzg7q8xTE2vMn04PCB
	X8tUuf6gsLsY+b7rZY3k8TrmyfRQGFrrUQPFjahxj/sZXtEUBQeTbep+Ehyd4Vq63Zi0yDImMwlGr
	FBr9ZkY/h0lvTak32kLvUHQ74MWwyzpmKZQOpe01cHtrjSsxIc2AYgfCJaCcYDu1y5nOQR0S0tta3
	a7vYnmavDjkKj6oXvh+K2LsQrIL2nXAafxX4G9WIJcL4SIZmb/bCPgPxcIwE9f0knE9hiirriAVan
	eZ5jyVw45ZA33ATO53bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZU11-00000004uuA-2GuA;
	Thu, 01 Aug 2024 11:30:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZU0Q-00000004ucz-20ud
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 11:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722511801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=gvGF3Ef4dkikJ/Hli43T5ir+KPPgKqAfpvG3aCiZZik=;
	b=TM+/u4uaIYXOMLuj9M0rPObNfvFRdCapmEoe73ml2WXpoliTBkuqcwhDeJ17D4Lze1CKqg
	HwWGU8Jcy54afYXZGKrOhWXB+jAiwrQqdRXk6qReeTX6VQnBxxPRfmViQPMGaCf90Zv8hE
	UzRd+DjfWlSAhEz2a0s9BkuB6/M2eKw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-eCFFAnTQNLSudFPLefCy_w-1; Thu,
 01 Aug 2024 07:28:12 -0400
X-MC-Unique: eCFFAnTQNLSudFPLefCy_w-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1908D19560B6;
	Thu,  1 Aug 2024 11:28:11 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F79F1955E80;
	Thu,  1 Aug 2024 11:28:07 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>
Subject: syscall.tbl refactoring seems to have dropped definition of
 __NR_newfstatat on arm64 and riscv (64-bit) at least
Date: Thu, 01 Aug 2024 13:28:04 +0200
Message-ID: <87sevoqy7v.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_043002_720503_6AEDA14E 
X-CRM114-Status: UNSURE (   7.35  )
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

It's been repported that __NR_newfstatat has gone missing from the UAPI
headers.

  [sanitizer] __NR_newfstatat not defined in linux kernel headers in
  aarch64
  <https://github.com/llvm/llvm-project/issues/100098>

  __NR_newfstatat no longer defined on aarch64
  <https://bugzilla.redhat.com/show_bug.cgi?id=2301919>

I suspect that's related to the syscall.tbl refactoring around these
commits:

commit e632bca07c8eef1de9dc50f4e4066c56e9d68b07
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Jul 4 14:33:34 2024 +0200

    arm64: generate 64-bit syscall.tbl

commit 3db80c999debbadd5d627fb30f8b06fee331ffb6
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Apr 24 09:14:39 2024 +0200

    riscv: convert to generic syscall table

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
