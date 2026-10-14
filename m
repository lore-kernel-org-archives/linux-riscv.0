Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19304CC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVy+YBBMlH3MLZXLjrYzXa7DDbU/hqpoMlMoB9RvBb8=; b=Wg2mF6pVYHwgSQ
	Tt0lNyU5ajYj7Iwb1Z6f8XBi8HBMtZdAju+ZmIcqML0CmZ9ULJYbIy4C1R6UrD7Cn8BS9xuqbyWlI
	76Ll7BoZ9QUtUOFyaIxOKe7suSdCpIPIRGiBZY1SWN9AvRcQTVIzSS2qx904swzo342PcBQNXFboF
	ZszvQghIrKW8RkehiwZckqm3LKgWMZpxFt+5FPwGRjeSzIZLoaC9J9dyvfubPVHFGFaoANoJQksRr
	oKQID/JQz4DyCahGTQfO1R3c7JFyfL0+FOvA8uND3w+TFKFXM66PurOvSQm+KFBw++YIHK201oYXf
	4svRisx1uA7NezB9PiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyqu-0000000FYmt-23pN;
	Wed, 14 Oct 2026 13:17:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyqq-0000000FYm7-2Tlr
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 13:17:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EFE3E4120B;
	Wed, 14 Oct 2026 13:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E5B1F000FF;
	Wed, 14 Oct 2026 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983819;
	bh=7RwE6iZAmFDGTIXch29CA63d+n3O3gLHdWAV3PwRBxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HVR30DuP09bFfS4VqogcUMqXMV5xSAmbRqoFJgoK1eUL/tMYKOVvcjSWmDKPBeEsd
	 TVPXrHGcsNbvO81sfGqqcYgY2RBVYKohBr3DCa9Iq1/znqDPRzV31SlTGrh6SLJVuH
	 zL2Hw68UpOlys8abUuXX7uR1IR6p7Ek+fBkLo7j0FFNShr/332N69/aungm9KKS558
	 frWczwZQTvOWCSOTkwJ9/k+ih/+zFiBI4y7z0rs7NfN6EKOrGIDWPGOUtJpu2aJQ3p
	 HwomaTn1VxnDUsmuAHDVgxuNAWV9KOGo6/9Qw63dDwnr6G1RjO8yBWzCFZgNECnXza
	 YtcL6kZw3eaTQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: zhangsenchuan@eswincomputing.com, Pengpeng Hou <hppiscas@163.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 ningyu@eswincomputing.com, ouyanghui@eswincomputing.com, sef1548@gmail.com
In-Reply-To: <20260920033737.13957-1-hppiscas@163.com>
References: <20260920033737.13957-1-hppiscas@163.com>
Subject: Re: [PATCH v2] PCI: eswin: Publish the platform driver OF alias
Message-Id: <179198380992.63727.7418600499689326147.b4-ty@b4>
Date: Wed, 14 Oct 2026 18:46:49 +0530
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=319;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=VYcuol4MmAAiVhGL5CS+WtD9mnQVulCMGjCPHR5N+QE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqz4DGwIv9MdYBuDidOIekkLfDsPYcUTdM1RUaL
 EcqJejTFjaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas+AxgAKCRBVnxHm/pHO
 9bN3CACCpe++dGTv3O5rpmaJNDgpXOCYZGI0pi5Q9JzS/lGlyfleQSB6+WboUXcH6ozWP1NI9KF
 9V1fisnVEsYf0IRt8IjoeIXmaFy2bJxJqpyKS/wapHVOZmlT2fpAYDs4zLNhn+oDOPx5OmRbbEn
 XbV1XVRfKh9akFB1cT+VhRQT8XQ2QhOxGUka/DzAbHQz8ty/vKDPjlptNXZzn5Yk3RIW0aMtzM0
 fMbh5AiHhY5wm2d1UJIm48ca4ay+e+vAt60+Tzsq0OWxY2+93pX/UtWFJBEeRFgX4P4Cy/dI7vf
 6o6kBAAemOUmlAX0bU8afy0IoWUDiJNoHfi/bcHQZlDPdPip
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIFN1biwgMjAgU2VwIDIwMjYgMTE6Mzc6MzcgKzA4MDAsIFBlbmdwZW5nIEhvdSB3cm90ZToK
PiBQQ0k6IGVzd2luOiBQdWJsaXNoIHRoZSBwbGF0Zm9ybSBkcml2ZXIgT0YgYWxpYXMKCkFwcGxp
ZWQsIHRoYW5rcyEKClsxLzFdIFBDSTogZXN3aW46IFB1Ymxpc2ggdGhlIHBsYXRmb3JtIGRyaXZl
ciBPRiBhbGlhcwogICAgICBjb21taXQ6IDhlZjZjYjI1OTFkZjAzYWZmY2Q5ZmE2ODNhYWYwNWRh
M2JmMjZmNDkKCkJlc3QgcmVnYXJkcywKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDg
rprgrqTgrr7grprgrr/grrXgrq7gr40KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
