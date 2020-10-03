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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72DEC4363D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 06:38:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6196F206A5
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 06:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3eLYHrl6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="g55jZzqA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6196F206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OiPwvM4G2/l7u8Dm3WLDyi0uIEyGN4zwynA4+zppTLY=; b=3eLYHrl6AeWQbQpRYDxC0SQi5
	57yb5ikt8+dECUf4efrHAxrxEeoWJTZNGexOW02A5ZUF+m+fv4mGC64wFk78a3X7u2FSY8Z5OqIil
	imaFx8ojaFgy72wK7UHgPtPyM45Xho6MGA40ceQE6Da0gTJLAn3T6l/QZfzHcHF+jaPhG5sY67no6
	QuV0dIqo9oPjzREx8VupH88NWWtPg7HsAns23xkccP/2Sms6pIhELJtON74syqIFay0hBVd3YqWEp
	TTfFyBNDV0+iUADc+rZYqVYUUwG33Qt8Fish226UpFB5+mhmDmFeoWcyIZuTw4nLinLKwaaa3cXe/
	A52iPhhFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kObBK-0007zn-Nu; Sat, 03 Oct 2020 06:38:10 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kObBH-0007xj-Pw
 for linux-riscv@lists.infradead.org; Sat, 03 Oct 2020 06:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1601707075;
 bh=XRD1G/FKH5P14Qoexkz4KABtNAoyURyyM07p9s6A2yA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=g55jZzqAXpsVo9RbgbGMro15/KEK4AFcMWrdbwImz473pZtOmJaiJwbz//1jX4CW9
 Qij0VWSkZKiofX6EHL6No0kxRzRb+qu94tofYJs0DxbjcYBEA9LyNd8pIuFiNfEl6V
 Stzs5swGlR/ESB2/krromLiah2I3ihqbn0ADvd4s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([178.202.41.107]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MvbG2-1ki3Gu4AmU-00seKf; Sat, 03
 Oct 2020 08:37:55 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 2/2] docs: admin-guide: EFI stub to main Linux handoff
Date: Sat,  3 Oct 2020 08:37:25 +0200
Message-Id: <20201003063725.8698-3-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201003063725.8698-1-xypron.glpk@gmx.de>
References: <20201003063725.8698-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:i+31IZulvm+Hkm7Jgc9slA5QQmVL8UwmQXplGyx3R1TkJGbBspR
 XPqhfjvk+xyIKZzg6xGtnym6LYGj2X/c3mml0ZtXvQELo7AglFu2XZuDPIWWAitvE8yDNgw
 84P5xxAjcRL80fFpZUmqUIxVt9IYKZSBnVteu54lr298LBb2oa7er5OvcTaVUgSnPMADJGo
 MA9ILHeYiCfEo47WlVY5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yRmdQYnLlKc=:Bgo/dGOvyZPkoTfpEazkt9
 Mq8GzYXyQz+Oy0m3rCNm0b5Z8Yx9ctatfa8KzVu1YxGvr/7lLGg88dxNX7ksWz/SOHvZ4o6xw
 Cqbf715H1RvmSXr/O5IWQV0PpQEfe5Y111J085ZTRVqZBKqQghpXxyNe0cnr6VKunrePa0ZJY
 3hgb+oZl4joxQnHP1xBXhjuQi1AbNqZg130i9dDLz/eu4IiPxvdr6wvgqywEP1ZQMg9DB081P
 Ici7eRvEX/MrAnbYUqKu7/bycqRs4WTGZ+xueMmd2TJDJFLOKYLog/p8Dqy9Z8hGyTVIhnnyW
 PylafJUW3WcjSIrVb97waWsUdlZxjz7NDxvThFLhsqUT+Pvd54onHnwCmMpuLupgahC2JPN/o
 lLp8Yju2LqoeoRPjpNCVzZyiDFjTwe41+i2hE4QMmVt/7plCq407JxIqdS7RR4c5GaAN4D1JJ
 zrTQtTjj01+62+WHDF9wXjMjnVw15yaLemD/7X+jvCNg6mm46/CYQz8KRZS+Mv88nFXTqRALF
 9JlT9vW51bn9Nvj8L2HMdTv3CFv4y+9VYA8OcDhWwIwIcueks3dibaMRituDGzvwhriSXDgJw
 fqhQsYEeXHfTcImiz0+V99+3yePKcIPSj6YDH0iYOEcdNGfhBgiOTirG1QKl1yzXyoc6LC51l
 zF2ppOiS65pd0/Z9HTrtEs+DWdUe5labAI0T86H3/gQkcs6B6DIZBPfC8F1cIsqEsfRoKn+gg
 ooPXVx0s/vY8XHBMDFVydea77mvPCicDCb5eZzXi3VP5fqOmObJBeJ5tg3TLYhZyrQZgwbb/l
 3q6FcKRAV9PIp4Ammt2N8UQqI+5XqGrVSZZb904c17/6AwiAbhv0Ql7nKjOQ+aM5OBwAnf0Cg
 EHO84YCGdx1ccKy3EHnvtfLwpHxxBEiR2veTQgz+KOxjj2adkUvxkcFuUiwQ+C3APUhMCx1R2
 +r0YIjMTEQ8fdGXi7DRr2U5dKzj42MuvuAUBryBx0VolVg88+uFYPQsCMBVdLWpn1OKHNhUOr
 iQjYnMEIYv6DYGn6uaZUpKb/LwpcHvIHxW4cI/AKK8wfKASPts3ytwC5PRirceBStfhYPriYz
 sjbjt86kxYQePZGEIbHU97ghXOhwNtUl/JgIBL4VLwzD4cn1P2MILACsW6k4gX2MFa/m4TIyQ
 RqKtzI5HN9D9NIOLnYwodw09fBMmv0VPrne6BDi0DK6H8AQRxUFmTgx+qEJq8OrxFi+8CnTzR
 bdm3EpoI15W6Up1/dCwYXGh/BIDeNLYwYfe0cnw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_023808_068224_BFE0354C 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Describe the handoff from the EFI stub to the main Linux kernel.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
v2:
	new patch
---
 Documentation/admin-guide/efi-stub.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/admin-guide/efi-stub.rst b/Documentation/admin-guide/efi-stub.rst
index 4965dec48af4..669602ff4515 100644
--- a/Documentation/admin-guide/efi-stub.rst
+++ b/Documentation/admin-guide/efi-stub.rst
@@ -133,3 +133,15 @@ described above.

 This option is only available if CONFIG_EFI_ARMSTUB_DTB_LOADER=y and secure
 boot is disabled.
+
+Handoff to main Linux kernel
+----------------------------
+
+Currently the EFI stub enters the main Linux kernel via the same entry points
+that are used when booting without UEFI. This might change in future versions.
+For a description of these entry points see:
+
+* for arm :doc:`/arm/booting`
+* for arm64 :doc:`/arm64/booting`
+* for riscv :doc:`/riscv/index`
+* for x86 :doc:`/x86/boot`
--
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
