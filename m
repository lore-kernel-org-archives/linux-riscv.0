Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019EAC54E64
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 03:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bE4t/kEjF0GUsd1JnWJonvhaJn0dX/V2VO/Zi8ePg5Y=; b=49YWnapNL9Dcww
	5kegLeSs2cNeXjkbXMQwDAy6/mJB7sWwBAD6ucAb/8y4YIPNsExkOetN4NnwExVEgl9fGTRPC/nqX
	gJf1wKrWJE/adVUjjTjvHjXwC/IGdsLvTDR6REYZ8BOd19pDdK+9Ngh3y4IiBAR8YlNvSbC1lVxKn
	VCvGI4N+cTPokfsCyhJAE/VMpIDQtlNNpgRwzlm7cPf3Z6/KmvpqWDeEGL+azFe7Qh2ZGCDqWrLju
	Lxhp75E9SXt8XRxvxyvbd/Xqr27cGd6KN2aeBrCY4xBNlBQxB7LON3c7wL3gIIw7nFBjtsZIZINKY
	nuEi5Niz8adNUYwy+flQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roxN9-00000002tfn-01K2;
	Tue, 26 Mar 2024 03:21:11 +0000
Received: from fhigh8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roxN4-00000002ten-0Hv1
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 03:21:08 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C3DC51140133;
	Mon, 25 Mar 2024 23:21:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 25 Mar 2024 23:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1711423261; x=1711509661; bh=1hRyPax4QBs5FbRonwEHF
	PXlx7oziPZG9Z5t18jQQI4=; b=Q/Yd8VHtq2w7trRU+PenSAEB8WDpXZnJbO1Qz
	XBxNN78ifZQ7x5TCWrGA6SGjGEc5arGrMThA4ZyqVWEqDAFoI4Khf1LwlZwiT3bv
	SFQMxpfku/OFMDxKxLaj0cUqYu0+HDo+Hv0du6luyB4q7rcIhx0ParitNa2dFlyJ
	Hqur5MWFOR97UUSkstYiFTEoFrVP/RMZijKo8HianWdx76xhq0EwsBU+kpZmzSTG
	YM0E0cmW5VCXXd+R+YOjBgg5meYZbFNPygSNfnMXxo5zYt4gpIw50mWA/1as3Vu4
	llTrM1nV6vbUpc7qc1cbFJLVrM/BBt6b5Zj7y4VTqvyv8eVUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711423261; x=1711509661; bh=1hRyPax4QBs5FbRonwEHFPXlx7oz
	iPZG9Z5t18jQQI4=; b=ON1c2YIq7YCCjVvp6ulRYsagl1sKh4LYiABlIcSBx1wr
	bmaybp3i2/staaPJ204QjAnMIMMyr6wH2xUTv9mjUh0m0wF5zek9vb/IqEvJWzjp
	ToAZ8VQJVa1cnVt357Kig52uUy+mfTW2hF79yHSLBqI/I5Nd1eHDMe1atdVW9Tvh
	9SFoVLg6z2xdfGh0XkdbIG+GjIUCBNYuZid8p/noWWwWY9fIKFurkkPIEVUVCC97
	BupAnePXRe/NhLk5BQ3tAOWoDkrSOu7xs11bfHukDiDshHbAt9n+QxcLRnuRgRiq
	5qbhmMrP7sAOj+59py3tPa/l1jiLRG21syv+TGx6kw==
X-ME-Sender: <xms:HT8CZoYADtc-24nhNbJei4EK4g51aQI5Djh1ZP1vz0hGUjGfs-sxcw>
    <xme:HT8CZja57BzNjtRj7VgNrJOeQwblnbjkaqpuG01a-NLcEbzpYeEhzR8JXUgHa7FhP
    T8A5DBcAB3c9S3dwg>
X-ME-Received: <xmr:HT8CZi-4WYi3dC9kzqaJGKG-7AzS962-WfH8zwImRkLgYx-l0Yx0YDARRbyb3p41Nxfbotwx3rxB20rojlcgloM5CWhj-9TgxX6ho10CT90pVD5YHm8yFF5RVao4qOKfmd7pT0aydx4QIu234nfG0zUTQljO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduvddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghfrghn
    ucfqkdftvggrrhcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeeugfejveekgffhgfegvdetgfegvdekieffvefhiedugeefuedvieekieev
    heeuheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:HT8CZioS5XuEL8kpg_E_qAk7yVot1kVNu-Ajp4xLN9TJdSdrXYPemw>
    <xmx:HT8CZjo81vUznFzYjdy_WSkN_ieo5a1DNcWa9BN0v55_UjvEC10uNA>
    <xmx:HT8CZgRdsnjhaKcmMzDmQsfLNkJU9UrOFt-kd1n7PKJJsxQREN1APw>
    <xmx:HT8CZjrE0E1Tj6S48KXAvGuganMyR5KySB08EzFgBm1yVvGTEcZTyw>
    <xmx:HT8CZm0Ra1fC2-oRopYtJZuyY6ldZ7g6s-FvpjM5L4vTLnrxxWL0lw>
Feedback-ID: i84414492:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Mar 2024 23:21:00 -0400 (EDT)
From: Stefan O'Rear <sorear@fastmail.com>
To: linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Cc: Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Stefan O'Rear <sorear@fastmail.com>
Subject: [PATCH] binfmt_flat: Fix corruption when not offsetting data start
Date: Mon, 25 Mar 2024 23:20:37 -0400
Message-Id: <20240326032037.2478816-1-sorear@fastmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_202106_499381_331D2600 
X-CRM114-Status: GOOD (  10.02  )
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

Commit 04d82a6d0881 ("binfmt_flat: allow not offsetting data start")
introduced a RISC-V specific variant of the FLAT format which does not
allocate any space for the (obsolescent) array of shared library
pointers. However, it did not disable the code which initializes the
array, resulting in the corruption of sizeof(long) bytes before the DATA
segment, generally the end of the TEXT segment.

Use CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET to guard initialization the
shared library pointer region so that it will only be initialized if
space is reserved for it.

Fixes: 04d82a6d0881 ("binfmt_flat: allow not offsetting data start")
Signed-off-by: Stefan O'Rear <sorear@fastmail.com>
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
---
 fs/binfmt_flat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index c26545d71d39..70c2b68988f4 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -879,6 +879,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
 	if (res < 0)
 		return res;
 
+#ifndef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
 	/* Update data segment pointers for all libraries */
 	for (i = 0; i < MAX_SHARED_LIBS; i++) {
 		if (!libinfo.lib_list[i].loaded)
@@ -893,6 +894,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
 				return -EFAULT;
 		}
 	}
+#endif
 
 	set_binfmt(&flat_format);
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
