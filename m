Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DACC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtR5TjmA1ZM1+6urK5q6ZDWYWV/1Mu/xZQE7OESum6w=; b=X2i+pOS4jS82A5
	G8b4UE6HnEAZQrZw2kVodkOK4btMwYvDRL/1zpZdO2i89znj5zx84NdHh80XiaQT8Jp6dL4P93oCS
	IpvtYzSIipkB6Dh7HyAAaIxUoXcbi0kukZ1aVWJTIJTlceI3BlnFvY2cqY5RV4n9AB0ZG2YWiBrc2
	9DP7XATPeV2WPcsAbeVKloGgWh37m0wRMlrab98tLDq3kUKrue3SOcZynLCwvp33Z0SrlRAmQJedV
	jxYiraXF3tV8Xy5Gq5i3WP+gS8rCRldtF3DkptRL+qgSVLf6EKlSAHzUlVgARSO7mYqFmC8LVgGRj
	f2hcC3n6QmxhSS2INrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JLM-00135M-2o;
	Tue, 07 Nov 2023 10:30:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JLJ-00130i-1q;
	Tue, 07 Nov 2023 10:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+gACgpTQj8OpvruPj/p3shExXAIg9qVB65uOYbGxgdU=; b=KqJga0cJkf0ea2I44dro/hehY+
	hdGHrWJf9SO9FdCGw+AG9MFvt/hy1EM8laesvxJR3tlIJm04unhSe1TyMvk5EOkVpAVmnQEzEGvk2
	erEqCrnXjQNiZHzYYZxVVhyVh7jBOTkO5gRjjijQwz8tW3XZQPsB1UeV4/h/eZcKG86V0Hz8ev82u
	xdr3rDxe/M5yjtU8f98kyXf+5wrQ8fSNhMKHgI8hgzksRtWxYcmdC1WQdfIj4RfgFB3Dh5PyS4lKJ
	OOd1sULTW/XN1dkdCIkVRG8j5hzT0k/nvc0vkOLSQ3xApjwWJrgOiQMzmMmP6FLoc0jLsOWEoyIsS
	XcI5Shxw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54700 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JKo-0000Dk-39;
	Tue, 07 Nov 2023 10:29:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JKq-00CTwZ-Mh; Tue, 07 Nov 2023 10:29:28 +0000
In-Reply-To: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RFC 02/22] x86: intel_epb: Don't rely on link order
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JKq-00CTwZ-Mh@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:29:28 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_022957_605175_2D756002 
X-CRM114-Status: GOOD (  11.54  )
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

From: James Morse <james.morse@arm.com>

intel_epb_init() is called as a subsys_initcall() to register cpuhp
callbacks. The callbacks make use of get_cpu_device() which will return
NULL unless register_cpu() has been called. register_cpu() is called
from topology_init(), which is also a subsys_initcall().

This is fragile. Moving the register_cpu() to a different
subsys_initcall()  leads to a NULL dereference during boot.

Make intel_epb_init() a late_initcall(), user-space can't provide a
policy before this point anyway.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
subsys_initcall_sync() would be an option, but moving the register_cpu()
calls into ACPI also means adding a safety net for CPUs that are online
but not described properly by firmware. This lives in subsys_initcall_sync().
---
 arch/x86/kernel/cpu/intel_epb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/intel_epb.c b/arch/x86/kernel/cpu/intel_epb.c
index e4c3ba91321c..f18d35fe27a9 100644
--- a/arch/x86/kernel/cpu/intel_epb.c
+++ b/arch/x86/kernel/cpu/intel_epb.c
@@ -237,4 +237,4 @@ static __init int intel_epb_init(void)
 	cpuhp_remove_state(CPUHP_AP_X86_INTEL_EPB_ONLINE);
 	return ret;
 }
-subsys_initcall(intel_epb_init);
+late_initcall(intel_epb_init);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
