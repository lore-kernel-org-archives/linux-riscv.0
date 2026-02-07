Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164E2EE0AE9
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FxU474Axzoympfn2uOz5v0qmyhsnH+aE7GW5+K+geKY=; b=1MgBbJ9taJb7zv
	Q+D/dT4NrT6idm/0Fe8gNNZjHuNQ7AK4ylKUVyr1HWTmqBlbUvFRhiKBGDVdrhbNNVvdujwbOlIBU
	DtwWJQ8+Wa6ECLG+6LAg+WMkAiX09w3CmzoFVdNG52JyU+WiTaJE6Prn+J0ONVW6+U7f3oVS5J6Ri
	tJ4MmNODualR53CBVQenCnjZpIA30/7mzqT8SvI2orUZEuGcIzfyITn5oDiTCdo8U9kb8nCOWgQ+E
	6/DzcCYn8ujdpR7ZocELD6bKj8Acgk7rgzljxXQEJuTF4iEY/8oBGOEKNhMc4Wjp5cDYjMZiZ+gku
	dVq+gVJSAC3nFQIO5ODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vojwU-0000000CYxU-3ALg;
	Sat, 07 Feb 2026 15:09:50 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vojwQ-0000000CYvU-026k
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 15:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770476908;
	bh=bYRxxyP/zLKU+q+qdZ7pw9ok6nL6LrXMBxbVr5QHVqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=mrnVchsnHgqrFwPQrhAVeldlJZVhX64KDnslm2Rc+Bmr8HsH4ZX/E/nJ1VcTv9dHD
	 p1DHxawm1HFJtIT/So5YdMOFMdBGhu6yImotKsxOX4wuL+vSn/XT/bQLO2vwjnc7tA
	 tY8wn1ZldDPuKkFMh1yWP1CVQpGCdJe7QMk7mcY8=
X-QQ-mid: zesmtpip2t1770476905tfb0debbf
X-QQ-Originating-IP: Uu9OsHp7+mhRwZVznA6YPCsG53vqq8H6CLvoIhU3lMI=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Feb 2026 23:08:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13363079978593066317
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v7 0/2] i2c: spacemit: introduce pio for k1
Date: Sat, 07 Feb 2026 23:08:20 +0800
Message-Id: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBvQMVK6SrRIm2oIMhQiCO+et
 HyL/1/InIQzDM0LiW/JEs8K2zYQ9vncGGWpBlLUK1IWfYeHQaGAl0Q02inngvbGW6jNlXiV5/+
 NUykfYI1a+l8AAAA=
X-Change-ID: 20260207-b4-k3-i2c-pio-318088c1b3b7
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770476904; l=607;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=ylEBIBc5vQ8/oAeziTgq3le2QlT3BoI4NTRFIJnpYSk=;
 b=H30sb6GLQFfEEZw0wbbDhgH833FM73XlJbJPuye3oKHNcCiWZTXwgFjHSfiqxTocR/PW1suSs
 NHy6bH0DiKCBzCLroxiiVxeQF0mQei9UGgZxYHgm0W2axeFvIMhIqLf
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OXP041Q9YQXuzVXwUy9ItD8mizGVUZ64XbwVeDVaONh5yk9TN/3NQ7gH
	H7fi3HH01kuhtvN/dhVNChYYIUvZJ2oeXUSchto0nuhsn+qkiTBp2nWhUlfIQx9oy4XQqCv
	ojU2haQ1674612nafiea2cT6GPvD1nJp77KqyZgKU38Mn+dBnsjC4tnzXE4WLTe4cznBR+h
	9Oxne920qpH+9fpbwO7QUBr6nnV2EIXpiBbmt/o6xl+pnvrTriP7WzIzp/SB1G7pUETrQaK
	jqoihaawXSUWqy2ZdMSXTpK2Pb1jGjRhMLtxr8+CjBLGy8yR/P92BMe/EyyhuBdMyBp1lgq
	zo55wDVdFTjlWAb9CxbBnwMO/oR8DEH6Pl+0/bmdjYsUSJTLx6gRG/j4SqYoKVCLz0umpfY
	hX6mxUZ3xkcGFkDG15WeqBo2ZYXfK3Sl4AoooA5pijNhPTcbwTO6+SsWZjw1B6tT4VO5U+o
	e9w82o4z/4RZnE9SxqvtwnciK94jMNlpune3soRN30U5xnT9KJannNAuwlB3VXGze2r7+8M
	I+JflNeDrTHpyJvRpmw24ZDh7haZuVgslqRZnCUATbQqZnMQhU4lsLSsnvp6RXM6tRlqcZb
	VVIERSfg8VmsksqDgGcDiMpsNJEL7GlafaQHjdqtAThfBGLsRolBTt0iHhzzDFkIRMsHyCu
	jUs8H51PWKR4fuKcrR174hEyS4t+VEb6CjDDxeSYlhcJmezq7lqccTwhOqmVtKW1MMpYTej
	3mJ/j7IR3lYKiBBiN64R6Fz/Doe50U3cHTUWMikdQFb6Tro+T9cp3hUJaZoe0soaKeh7k/G
	0+RHxjp0S8eixacwRQQgsa+uIBD2Pi/2JhRhzM0XswWlRArWUp58M4rvl6+7s+8ms+oa+hr
	hdqDvw+pnhMwAP96O/LOPDFpbFv7tLefsIiUYD1pq/easen3Q/Q5VzhzOI38WydYGJBAQbJ
	0UX4j3bjG1KY9jWqrCM30LlWEGzYjD4yfYY8aFVkkVTt7HwXf3AaokGekUG4uLPLy3rJU1B
	+2xv1RwiynJc0qP7yOWvRoenvEeBs4EjapQ3zurAIS9qQH8FgOSVHl5rVn0f5rOlNwVxUAt
	6yLkV9FKhS3V/HRf+nvLYXEyL62D1SQ3PrCHey1C1KWNzOFtFDo17Mor5zFHyPm8T3+8NI9
	85uuQYfsQ9qDbcQ=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_070947_745480_B132E40A 
X-CRM114-Status: UNSURE (   3.33  )
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

This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
enabling the use of I2C in atomic context.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      i2c: spacemit: move i2c_xfer_msg()
      i2c: spacemit: introduce pio for k1

 drivers/i2c/busses/i2c-k1.c | 316 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 236 insertions(+), 80 deletions(-)
---
base-commit: 2fe0719258a48c204270366ef574066122e81924
change-id: 20260207-b4-k3-i2c-pio-318088c1b3b7

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
