Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC60FF8868
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuiURD7a+Mbt0Vbkwzdjyf0tLLBdL8uDOAY39lhBN5o=; b=X0d0sJg70XhL7z
	JdBWmcf+2SVAE5LE+1dcecCZnZSeswIZTwvjUlWOTWipA6s2LcbGy/VtgzLzrxUWdGCfgruR7H73F
	NyrKmnG/eU9SWT/Hpq5gr1OLmlCzHCyxujeOn+Tuyx7CHUf0PCSIBLyG5bFeCHF1nKUwdGNg3L0D5
	FbFqtIQ6Ht3CBsvD0M93XdExxqaBkCZJlBLUVHvl7O7yklxaIBZT9GbQ2xmZvpqidSn6XVFbbOK39
	k8Li8iWLBFIDvlpgQ76EI6qOUfzngjV92M8jjQ8IYz14dl9fL0Dz+qq69IBoAWYeP+Ni7JvtQ3ZWV
	D10freZ47wbRivlVw9jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMrF-0000000H4uE-2wbQ;
	Mon, 27 Apr 2026 14:22:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMrB-0000000H4qF-3CCq
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Apr 2026 14:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=3avbr85MpkWbphCM2ttXbj2b+MUNsJBRj+DhC28xeEc=; b=Kg6jH6nS7y109QO3Kh5cPyx7wl
	k6mgYOk4r8bIofB0z2U8p8btmFfNx8UEaVU4rX57a9AckYS8YfLJplfVqvSEvqouKJaR804BhnQRE
	7X2D6fgSAdjUGa4ksurQT15kDqitc0AXZ4U/Dfyqyi3x5aNm5x2GaokXWmjPMHvDWPgRhs9x4133n
	dNZnQcaOrO/Q9eYwDfVmUdCAM2eBh8ZbJBIxiPVkICT1+ekCtL5Xiep/mU8rWBLA23tfgEkvEDakL
	gfHXTFO01xstKmfWiFHnG0Q6J6psQPV5L2pkyuICDgsFY6+4Io8WFBfr3RGW8Vcg0vClRpenlly61
	9dAHJeVQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMr8-00000000myW-3dW5
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 14:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8101744733;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3BDC2BCB5;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299756;
	bh=vIA3xtTJnuuolAuvS6pYp2PgkibgyICdVHSyrMYfBXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qyplwXDG3ZO3dPSj7lrcyH0Uc/XnzeaOG28ON5TnK+07AvmDZfS2Af3Oqt6jLS/On
	 sCMNUlpLg2U5Tc3wqda952zNLk2Nf/qjln7doh53LOyWRNuq/qCZk9a5EMfjBu+lJB
	 /mE7iXLP1BuZE5P4raDIYmxC1+GoieEvp0lxGrwbIe+e6+4x18b5aGzbZphrP3neEd
	 E/fYnKXVo4tHqERZAlG3eoOuopUL2EPk5vbuG69+rviBNBC9HbilPdg+q7zr7QXTYB
	 m+VOy/U/0QIzu4o3TXQdpBh9jUSocnf21cmF187cyUm8n5IKwdUF4vWPc/dFgCP8GI
	 w/i42V0eZtsJg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr4-0000000C8WB-239G;
	Mon, 27 Apr 2026 16:22:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 06/10] docs: maintainers_include: preserve names for files under process/
Date: Mon, 27 Apr 2026 16:22:24 +0200
Message-ID: <46961bc932be804cec19f06d202c23423d4aa12a.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_152239_197329_95520CA6 
X-CRM114-Status: GOOD (  11.49  )
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

When a maintainer's profile is stored outside process, they're
already included on some other book and the name of the filesystem
may not be there. That's why the logic picks the name from the
subsystem's name.

However, files directly placed together with maintainers-handbooks.rst
(e.g. under Documentation/process/) is a different history: those
aren't placed anywhere, so we can keep using their own names,
letting Sphinx do his thing.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index f1b8d4b00c2a..948746b998a3 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -76,11 +76,13 @@ class MaintainersParser:
             match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
             if match:
                 fname = os.path.relpath(match.group(1), base_path)
-                if fname not in self.profiles:
+                if fname.startswith("../"):
                     if self.profiles.get(fname) is None:
                         self.profiles[fname] = subsystem_name
                     else:
                         self.profiles[fname] += f", {subsystem_name}"
+                else:
+                    self.profiles[fname] = None
 
             match = re.match(r"P:\s*(https?://.*)", line)
             if match:
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
