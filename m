Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D10C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 00:56:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51476101D
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 00:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B51476101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tV4a9XGS+UOYkLK/J+DEG44XauKsEVDVq4t0UZBtmME=; b=rPx8A95eBs1oyfvGiDSfoTMkc
	0h4TLIf1WqbEY2c0uygJTpMsyi6307O8a09kOSh3HayTnpgod/QKFeEzsARUcdEPZZDLPwv4xtKCr
	mlyWGctdxXDLkVGfuGGvpS4gVE4tWNLnYe5gFqYK2URgBJkkz8DM/x90f3Cs7if5a1c7i9FpbMBFr
	1o1zc3XWadt6NT+m+LE4eFNE3+jsLSIZM41YT/Z59D+BMfVveAyZTo0LbY1rk/+GUi4kbtvrekYVn
	b40blu8MXvALw+w/AcqbOfOn3ipArOizgXKFW60O3P/vSKb7jzP4S5WVKtTFbW/t0Dm0FLoG3uscZ
	OR99jocDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYID7-008qEv-9n; Mon, 19 Apr 2021 00:56:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYID4-008qEY-JZ
 for linux-riscv@desiato.infradead.org; Mon, 19 Apr 2021 00:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ufG3ghvJ4buyCaWzU2EnehZaO+hWmO9RRHTI40RgGNs=; b=BF3Y+QuB13+S6WCiUF068iTsOj
 /unTwUPwVLdir51UPw5iah4lnWpUIZ/h2t7W318sqWW/WQl2bZxVzMZOJ85qoevD3zeWo4L+miPWa
 1uLw+JhZJ48Gv4IOztmLA0SdjmB4I74kUzlaFXpqlPwNthqCmGsjluw4eqa43TD0rDZGqNdjmDkNr
 Sl2qNCsvjWLxjiEgzplp4SRra+PYFU334yKGszuITIH0wAzSaS9IyJLG+z5TqoN/jLn2Izw+9Vj4A
 k2M4HviKAWjj80nvNWu+yBfXO4fG4js8pfcCERchJAM20juIlISaDqj1m1mdDGviTdDa/dD9HMg2f
 WtuvZHHw==;
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYICz-00Apa6-UW
 for linux-riscv@lists.infradead.org; Mon, 19 Apr 2021 00:56:17 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 13J0u0S2011029
 for <linux-riscv@lists.infradead.org>; Mon, 19 Apr 2021 03:56:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1618793755; x=1621385755;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rEmZ8MA7Mmcm1B3W8WjBdSUosxLDHFbHVrbU4iEAoGY=;
 b=bkfr8VsqmbGkclM0AXFQxA6auVIAgLUl5JUWAj4wzRYSlXuZnAQvRAtZMdZEtXJ7
 fYRcvDb/YJrxlut0r4nkkeCxijTCUhtxbi2K8E4xz7MGsCgZ+yBOekMhCU8sxZej
 3jfjz3n6GpXpQMJBDUi4sOyWMJmMkhWWQ1X0UEaPGE/Mtp50vGc9Ap4EosGMhdSb
 H9fGnq+JdquTT/pPxw+epoptFmoeAk5Ja2TUvcWmwD53vC5s+ulkhVFuX+2I22SY
 nK29bcZqelW0YsrzEUYWvLnDoXmR44/zfdy2sqaUU3X2eJlc8akgOirK2ff4BMJi
 cJjt955JQQB8OLqe5Np2BQ==;
X-AuditID: 8b5b014d-a70347000000209f-e3-607cd51bb1fa
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 04.FF.08351.B15DC706; Mon, 19 Apr 2021 03:55:55 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>
Subject: [PATCH v4 1/5] RISC-V: Add EM_RISCV to kexec UAPI header
Date: Mon, 19 Apr 2021 03:55:35 +0300
Message-Id: <20210419005539.22729-2-mick@ics.forth.gr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210419005539.22729-1-mick@ics.forth.gr>
References: <20210419005539.22729-1-mick@ics.forth.gr>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsXSHT1dWVf6ak2CQcMDOYvLu+awWWz73MJm
 0fzuHLvFy8s9zBZts/gdWD3evHzJ4vFw0yUmj81L6j0uNV9n9/i8SS6ANYrLJiU1J7MstUjf
 LoEr4+b6Z2wFj9gqNn3ZyN7AeIG1i5GTQ0LARGLRgf3MXYxcHEICRxkl9n3axAaRcJO4fX8n
 WBGbgKbE/EsHWUBsEQFzieaZrxlBbGaBDImj+36xg9jCAo4SZ46uBouzCKhK9O27DFbPK2Am
 cXDtayaImfIS7cu3g83nBJozZcJnsHohoJp5/+8yQdQLSpyc+YQFYr68RPPW2cwTGPlmIUnN
 QpJawMi0ilEgscxYLzO5WC8tv6gkQy+9aBMjOPQYfXcw3t78Vu8QIxMH4yFGCQ5mJRHe+7U1
 CUK8KYmVValF+fFFpTmpxYcYpTlYlMR5efUmxAsJpCeWpGanphakFsFkmTg4pRqYUk1jnmxq
 m84nJf9kzppvjq0blx1xt7ib+XSalGtJ1acGbdObV5h6jTQEts5Mn9LJeb6xUFHN8sKnxN3O
 Mpwdy3MjHj10Snvaekz44wqn8/pFL3g2VwswJ3Us9VuruW9Kd3SHalWtidREP/O9lyrn1X9r
 8JxTez0mVFeojHvaVta0rANiR+O1Pmb8WmW2wMGcU6ru84e3B28wuSquZ9RYuPDolkfhir9m
 zmR+v+5gzfmJX+7PXPvUw2fZi/I/5lZaJS2i93PjJbP35pxe6rdol92s6JJZnZ8mqmQd7La+
 yinzVXZF5c3bB5MfdX+ay2v5cr6A1MVgvbtLMhdcXi36/LB7b6HR9NPLvghFbzOTUWIpzkg0
 1GIuKk4EANdfFgmsAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_175614_391184_8FC21F91 
X-CRM114-Status: UNSURE (   8.26  )
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

Add RISC-V to the list of supported kexec architectures, we need to
add the definition early-on so that later patches can use it.

EM_RISCV is 243 as per ELF psABI specification here:
https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 include/uapi/linux/kexec.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
index 05669c87a..778dc191c 100644
--- a/include/uapi/linux/kexec.h
+++ b/include/uapi/linux/kexec.h
@@ -42,6 +42,7 @@
 #define KEXEC_ARCH_MIPS_LE (10 << 16)
 #define KEXEC_ARCH_MIPS    ( 8 << 16)
 #define KEXEC_ARCH_AARCH64 (183 << 16)
+#define KEXEC_ARCH_RISCV   (243 << 16)
 
 /* The artificial cap on the number of segments passed to kexec_load. */
 #define KEXEC_SEGMENT_MAX 16
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
