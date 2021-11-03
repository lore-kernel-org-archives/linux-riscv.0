Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71FEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 06:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF12B610E8
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 06:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF12B610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pHO1z+wROKygOM1HCXCv1CdcS1NDodY4BY2HIlc5oPA=; b=nNOXuua9Vr3CDB
	7ZFNbv0YsUyuWxejz20wmDWwovAwfrMR2/gEFBwwMXlyWh6laMjF+dOR82Onn0AoNV6kZEzI/gqY8
	K5ZShF/qRcerJEXzVR8lIV+MDe9lHrrvwYkeM2M6XKyXfQ4wwo1B51pO3A1phF8ril0PmZPR8D+zo
	N8uC6kLWQYunqYmX7e1HYWjtpX2VnwZVDKadBQpty04CFT8lSg0xk6KB/VibHYOCTtcdkD1Fa+ISV
	HPnip8QdchvQpETnlMJRQYPibID1y9Bw1+mB/ezI0tuix4J71WnqGaG7ejgOv4sGHJVID0PDMtKQP
	X3X18gABXpqm+JdT74EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miA6F-004L8N-Fi; Wed, 03 Nov 2021 06:50:19 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miA1B-004J4b-Ps; Wed, 03 Nov 2021 06:45:07 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so652856pjb.4; 
 Tue, 02 Nov 2021 23:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mi8r83pUTBrcQ3MNCYSGeibYSRXnJ8qCuYpYc7RJ1PM=;
 b=ZsNvY/1QZJqQwmSQD0ybdPyn4eJsxCZ886ZuEMim6DMxXNegPsZxY6Mmq4/5K/j0sa
 7LnF4lcNyDBe3XmSDd+30N3idJn7j7+z/lGNM116lkLxv6RQbn6PyFnxYdLT0uF9K2j/
 m554MJiuBAjQB5HoPtuBw7Q8XFTyt37bFkMoNa6ujxQxo4uLbtYfDTRGZmdsILGmOLXT
 mxSbbkzDiSPtM80rdR/2krFfIFTQ0NSCBJ5qgUyNQyeacGz259zne9E767hBwXK1RySr
 7Q2q9NGYSCDAQwkVL6yNC1LGn0nv0HmENdu69QlCdBm7fC9sFsWFIHvp8tbEcyfxrzlx
 xRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mi8r83pUTBrcQ3MNCYSGeibYSRXnJ8qCuYpYc7RJ1PM=;
 b=nJkeqjuIMOOwhNYBqOvl4I2Hdk5FFEx1MrGIGgiNCVghvYMMauT/3CuSgIXi+XQwAQ
 9+p7dqHCY+95jxWGS29sraAMjL3YUJZhyXhUtbjsuKBisK515UXuoHzlhYf2BNjwrh/G
 aAvGBtazAej2/d23Jcn/b3v4E4EI7n/sfl4UAWJ7pJflYScsWVAYHSsVO8HLVrFQeKuj
 u3SySMuyWenpZfXKz+h9x4gvlt6R+XilHkE19kD+MY6ZCg0iCXPZYjGmNrqedNC1jzt4
 WPytXZfjn3JtEcLYqX82lIK6yBSb9sOCE9fiasuiRlhPX3OwgmbDRtW2wwCp20NMiRMh
 1Tmg==
X-Gm-Message-State: AOAM531gZw3WQCM3mDglPHCjS08qJSuFpznDHwySGj2F+V6iTD0DTZpl
 4yrJdW/sz8/lMFN88iBYkbQ=
X-Google-Smtp-Source: ABdhPJwyrnGs7LULTukmToIpcaU8jGvQcHTFD9U/AKD/YWHxNv+Au45UjpJy+CtAzY6Bamn4smnLBg==
X-Received: by 2002:a17:902:c206:b0:142:631:5ffc with SMTP id
 6-20020a170902c20600b0014206315ffcmr10004182pll.38.1635921903857; 
 Tue, 02 Nov 2021 23:45:03 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id q32sm898389pja.4.2021.11.02.23.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 23:45:03 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: zhang.mingyu@zte.com.cn
To: anup.patel@wdc.com
Cc: atish.patra@wdc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhang Mingyu <zhang.mingyu@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] RISC-V: KVM:Remove unneeded semicolon
Date: Wed,  3 Nov 2021 06:44:58 +0000
Message-Id: <20211103064458.26916-1-zhang.mingyu@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_234505_889363_78152FAE 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Zhang Mingyu <zhang.mingyu@zte.com.cn>

Eliminate the following coccinelle check warning:
arch/riscv/kvm/vcpu.c:167:2-3
arch/riscv/kvm/vcpu.c:204:2-3

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Zhang Mingyu <zhang.mingyu@zte.com.cn>
---
 arch/riscv/kvm/vcpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e92ba3e5db8c..e3d3aed46184 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -164,7 +164,7 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -201,7 +201,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	return 0;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
