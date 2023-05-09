Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0773FC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0RIERVpZzobVKTjC2odXvZbuxjOcKhl+VfW6RoCQh8=; b=Kcqn0uuyry2AvV
	lGeLnWInrhmeWVndR9iSwwfPV/oa0RShK3Rgf8pYC3SSKuZZoHoGJDvnxXTMeoFwUGMyCYZ5+wbrm
	F08wnCyFN3ew5ihTQYExy50YlqUP3lDaLgPHlyBTAtZtK2zvWec/6Nk63Yx1Vpw8AS9i1yp5z/3Vp
	7yz3AiZsa4/YtaUvWH6SNI20v35PTLu/eKdJoP5MBkJRN9jvnpSFY26KzwDLWETbXPr1n/7xf9NnE
	qh87xaQN4DghA4CW2o47VqAhoQWAXNRSHxVuHMVKB3nxpi21gcHehTkCNNaQKXkR6q/vvsJybHCYG
	wYuADHutbTeBXeH8QUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMUD-003I2Q-3A;
	Tue, 09 May 2023 12:30:33 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMUC-003Hzf-1E
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 May 2023 12:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qucKeRyh/Imh/QucdmZht4NliS4NWL7FZ9KuokUyTQ4=; b=YHr1BJcZ/iONWarlxk0OG3RMbI
	fdeF94DRomh5mGxn4uQ/svmafIfrdzq56IGGSP5fq0mTb5rT7vyGAysXGlWkQeYRD+wrlWQmid9pD
	/7M3LlZ6PWYBjyUA9bG/IZv35RbODN6VO+yY3Ow1JE5WX0GfCxp5cEr15WCI5iuHR8U/4ChJdpz3A
	vOI/0rtlUzECJ1WJsGJnPjPuZ6MSXFtKotY/QL74c9G8Ooz5++rpWABTPo9b0gaoWkh69niGA0i5z
	l+qOYFu2gVdBhEGBRIH7WITqAJwaVR2FwUJjsbekF+DLgY2aYcCAgP+2cmYhID3UvtGuT9ULUwKHv
	Iy0FzJ9A==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKf5-0066Ch-2C
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:33:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ab032d9266so53544995ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628416; x=1686220416;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qucKeRyh/Imh/QucdmZht4NliS4NWL7FZ9KuokUyTQ4=;
        b=RPHrkafqXS52Wg7m6OhvO5aJv73Qq0CPcXlWNAChl9UFVDlc7obLTUAb1mX7TO3eBk
         /VEs6rJ9PxTZKSG7MnxNdDpg10fxFHmy/21n9Ghtl9CUhqrRdB73OuSsrlxz69txwk+T
         m/hNCvQo4ID72yyqc940tYoMMfNGaL9+UpFECLx6Ut9AL+uGXrgpnYRycGke34mYFDY6
         16Zb2/Ub6DDT4VYWEcLgSXk/WRgzdJbySCGNEFwcQ6dW0bkh0ORQKZmZ9d1WhdKXvbWA
         agvf9ixKTq+GMCf2KESyQ3DyOXMs357vkPNWyGm4/cPCeNKJS7qBc9Uh6tP5caFAb5sx
         vi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628416; x=1686220416;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qucKeRyh/Imh/QucdmZht4NliS4NWL7FZ9KuokUyTQ4=;
        b=OycoBYSix1Q+Hld750Z8iG3t7XBSqRcGZkKhogMIY+0s3nj2LbMzoPcqrBEU0jHsa4
         h2Avsal1SamasEOW3exDfNKaBbMa+96ktZHLR897KlidKqysLAvjeMFOlwElVnEYe3YV
         EtH0a66DUXb53VT5a+pKy5rLTKyR+HubYG0QXSxEC8y2Nkj8wYap7+/2dJk4GnfVZwCR
         vbz7MSASqo0zu6gt0wlPoFh6rHX5AqR2J/8thGs/kCdxdJM18zoWZLXLqM6Z0nUyZdGQ
         mnyas4zVkKpaMtheptD5JVEQOldXzarwicuzDlQLwYXz6HJi5xpnd4+xZk28Tu140dBI
         XD0Q==
X-Gm-Message-State: AC+VfDwQ7XI36smEg3ekV2VX4DO9DnahLUpRWHtnL0XYCVDzLzePSYbh
	nYxXjdjLbrDGNGWbb1lt/raCIbHx9PYA5f1xo4dG8/yWvrRdXKt2/G6x95CHLUaP8gjsDbtV+BW
	q3WzAJgMwiBtrbxf/cApTcsB9isma8C36y4oJVzSl3LzEgemvobYk/Z/lTYEViW07q467f3zbHO
	3zsb2+hPYwY+Bz
X-Google-Smtp-Source: ACHHUZ69hHFFrmlH7WzhZrLSkuYBwmBwSmfhQkhRM9vbdt9geJFktynx5l8H14IWczWj026EcHV8Fw==
X-Received: by 2002:a17:902:ecd0:b0:1ac:7ae7:3fe1 with SMTP id a16-20020a170902ecd000b001ac7ae73fe1mr7424380plh.20.1683628416235;
        Tue, 09 May 2023 03:33:36 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:33:35 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Evan Green <evan@rivosinc.com>
Subject: [PATCH -next v19 24/24] riscv: Add documentation for Vector
Date: Tue,  9 May 2023 10:30:33 +0000
Message-Id: <20230509103033.11285-25-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_113341_584007_45AAF9E0 
X-CRM114-Status: GOOD (  26.04  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch add a brief documentation of the userspace interface in
regard to the RISC-V Vector extension.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
 Documentation/riscv/index.rst  |   1 +
 Documentation/riscv/vector.rst | 128 +++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 Documentation/riscv/vector.rst

diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index 175a91db0200..95cf9c1e1da1 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -10,6 +10,7 @@ RISC-V architecture
     hwprobe
     patch-acceptance
     uabi
+    vector
 
     features
 
diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.rst
new file mode 100644
index 000000000000..d4d626721921
--- /dev/null
+++ b/Documentation/riscv/vector.rst
@@ -0,0 +1,128 @@
+.. SPDX-License-Identifier: GPL-2.0
+=========================================
+Vector Extension Support for RISC-V Linux
+=========================================
+
+This document briefly outlines the interface provided to userspace by Linux in
+order to support the use of the RISC-V Vector Extension.
+
+1.  prctl() Interface
+---------------------
+
+Two new prctl() calls are added to allow programs to manage the enablement
+status for the use of Vector in userspace:
+
+prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
+
+    Sets the Vector enablement status of the calling thread, where the control
+    argument consists of two 2-bit enablement statuses and a bit for inheritance
+    model. Other threads of the calling process are unaffected.
+
+    Enablement status is a tri-state value each occupying 2-bit of space in
+    the control argument:
+
+    * :c:macro:`PR_RISCV_V_VSTATE_CTRL_DEFAULT`: Use the system-wide default
+      enablement status on execve(). The system-wide default setting can be
+      controlled via sysctl interface (see sysctl section below).
+
+    * :c:macro:`PR_RISCV_V_VSTATE_CTRL_ON`: Allow Vector to be run for the
+      thread.
+
+    * :c:macro:`PR_RISCV_V_VSTATE_CTRL_OFF`: Disallow Vector. Executing Vector
+      instructions under such condition will trap and casuse the termination of the thread.
+
+    arg: The control argument is a 5-bit value consisting of 3 parts, which can
+    be interpreted as the following structure, and accessed by 3 masks
+    respectively.
+
+    struct control_argument {
+        // Located by PR_RISCV_V_VSTATE_CTRL_CUR_MASK
+        int current_enablement_status : 2;
+        // Located by PR_RISCV_V_VSTATE_CTRL_NEXT_MASK
+        int next_enablement_status : 2;
+        // Located by PR_RISCV_V_VSTATE_CTRL_INHERIT
+        bool inherit_mode : 1;
+    }
+
+    The 3 masks, PR_RISCV_V_VSTATE_CTRL_CUR_MASK,
+    PR_RISCV_V_VSTATE_CTRL_NEXT_MASK, and PR_RISCV_V_VSTATE_CTRL_INHERIT
+    represents bit[1:0], bit[3:2], and bit[4] respectively. bit[1:0] and
+    accounts for the enablement status of current thread, and bit[3:2] the
+    setting for when next execve() happens. bit[4] defines the inheritance model
+    of the setting in bit[3:2]
+
+        * :c:macro:`PR_RISCV_V_VSTATE_CTRL_CUR_MASK`: bit[1:0]: Account for the
+          Vector enablement status for the calling thread. The calling thread is
+          not able to turn off Vector once it has been enabled. The prctl() call
+          fails with EPERM if the value in this mask is PR_RISCV_V_VSTATE_CTRL_OFF
+          but the current enablement status is not off. Setting
+          PR_RISCV_V_VSTATE_CTRL_DEFAULT here takes no effect but to set back
+          the original enablement status.
+
+        * :c:macro:`PR_RISCV_V_VSTATE_CTRL_NEXT_MASK`: bit[3:2]: Account for the
+          Vector enablement setting for the calling thread at the next execve()
+          system call. If PR_RISCV_V_VSTATE_CTRL_DEFAULT is used in this mask,
+          then the enablement status will be decided by the system-wide
+          enablement status when execve() happen.
+
+        * :c:macro:`PR_RISCV_V_VSTATE_CTRL_INHERIT`: bit[4]: the inheritance
+          model for the setting at PR_RISCV_V_VSTATE_CTRL_NEXT_MASK. If the bit
+          is set then the following execve() will not clear the setting in both
+          PR_RISCV_V_VSTATE_CTRL_NEXT_MASK and PR_RISCV_V_VSTATE_CTRL_INHERIT.
+          This setting persists across changes in the system-wide default value.
+
+    Return value: return 0 on success, or a negative error value:
+        EINVAL: Vector not supported, invalid enablement status for current or
+                next mask
+        EPERM: Turning off Vector in PR_RISCV_V_VSTATE_CTRL_CUR_MASK if Vector
+                was enabled for the calling thread.
+
+    On success:
+        * A valid setting for PR_RISCV_V_VSTATE_CTRL_CUR_MASK takes place
+          immediately. The enablement status specified in
+          PR_RISCV_V_VSTATE_CTRL_NEXT_MASK happens at the next execve() call, or
+          all following execve() calls if PR_RISCV_V_VSTATE_CTRL_INHERIT bit is
+          set.
+        * Every successful call overwrites a previous setting for the calling
+          thread.
+
+prctl(PR_RISCV_V_SET_CONTROL)
+
+    Gets the same Vector enablement status for the calling thread. Setting for
+    next execve() call and the inheritance bit are all OR-ed together.
+
+    Return value: a nonnegative value on success, or a negative error value:
+        EINVAL: Vector not supported.
+
+2.  System runtime configuration (sysctl)
+-----------------------------------------
+
+ * To mitigate the ABI impact of expansion of the signal stack, a
+   policy mechanism is provided to the administrators, distro maintainers, and
+   developers to control the default Vector enablement status for userspace
+   processes:
+
+/proc/sys/abi/riscv_v_default_allow
+
+    Writing the text representation of 0 or 1 to this file sets the default
+    system enablement status for new starting userspace programs. A valid value
+    should be:
+
+    0: Do not allow Vector code to be executed as the default for new processes.
+
+    1: Allow Vector code to be executed as the default for new processes.
+
+    Reading this file returns the current system default enablement status.
+
+* At every execve() call, a new enablement status of the new process is set to
+  the system default, unless:
+
+      * PR_RISCV_V_VSTATE_CTRL_INHERIT is set for the calling process, and the
+        setting in PR_RISCV_V_VSTATE_CTRL_NEXT_MASK is not
+        PR_RISCV_V_VSTATE_CTRL_DEFAULT. Or,
+
+      * The setting in PR_RISCV_V_VSTATE_CTRL_NEXT_MASK is not
+        PR_RISCV_V_VSTATE_CTRL_DEFAULT.
+
+* Modifying the system default enablement status does not affect the enablement
+  status of any existing process of thread that do not make an execve() call.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
