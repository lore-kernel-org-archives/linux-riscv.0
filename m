Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CDCCD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X11NkhgA79/ppp/OQHIgmfSjQndlWLBL/0xZOPlTHy4=; b=1t6CeL26PaSqfS
	1/sLMBCwUa1f/lXx6s1quLk6uVjJrlMmyiJWW2DdaJDQ4Xclttndp5J26pMItoBAh42pltksWRiO4
	m/6YRRKA8GQKl7sDAArhLcezzirm79JUkwVMkyJVo2oZf3yxqEXqDPQ60IsIE+iwa9ZNwHX/+APsv
	o3dLvCu7BghB65cfsDFK5xfw1P7nFeT05jfrSB8A+Qgnz2u4mLVNmVC0jhDySSJFY+FZD8rC/2z07
	QNoXHfYDxOqNPglD1Zgo1lgOJCJgJuAlD8I2DiY3reSc4sRepg0SLIf8xLZhsoJtZliGfsE21R78J
	W2VKzdIz6C7XboLB9Ssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN44Y-00000001ZvM-32lB;
	Wed, 13 May 2026 07:32:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN44Y-00000001Zus-0Xdn
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 May 2026 07:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mmxOVGUrnxS/H09zubyapT22aA5Jy+w6JF95xU/Ftgg=; b=Jc2+GUAiUGLTCG7k8cbuj4y2w7
	Ez9qktrtFspkySXPMxlAMpXd0kQ8d16H+ya16waXA4MEEOSargbPqgz0eev4sJK0fM37LnmiISTk5
	ohKeuzgjkhQSvJqeSwmhAp376cz1hfQSXjt3/9EzGry0N4T+0HW2QGrJNhZZc79hs5OSq3RiYCD74
	XROVpjU32sKMYrrclI3iX5NsWc7dTaZiXbDWxoEzHOyQ0f5+OxZsStOzx3ozTiFPiALGYGjTaMTLF
	IYLenyOTWUNQzvRkWls8sUXWphBzfmQCEvO6trC5yqGAhzCIS2vHpvYL+SjZ3yhNIzh19hhzDgvRv
	0EecCBZg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN44R-0000000Gm0Y-0blw
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778657514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmxOVGUrnxS/H09zubyapT22aA5Jy+w6JF95xU/Ftgg=;
	b=PYwyyGywFBGZ1Jv1S2qDoKy6PwRLZptr1QQ9T4wgorXxLWoYuyHAXMgU1SyTOzyFh7avmQ
	DsCYrLl4N9aCiYQN5bXHNKosaHXmHWYKaROi1khsoAr7CT2tFy634GaTy/u1N+J6E/8IsX
	ygpEjRaQ4KYFmBOgMPYOkqsZ+FcGN3g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778657514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmxOVGUrnxS/H09zubyapT22aA5Jy+w6JF95xU/Ftgg=;
	b=PYwyyGywFBGZ1Jv1S2qDoKy6PwRLZptr1QQ9T4wgorXxLWoYuyHAXMgU1SyTOzyFh7avmQ
	DsCYrLl4N9aCiYQN5bXHNKosaHXmHWYKaROi1khsoAr7CT2tFy634GaTy/u1N+J6E/8IsX
	ygpEjRaQ4KYFmBOgMPYOkqsZ+FcGN3g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-131-M8ob-ZXROPOZrHCLAy5ceQ-1; Wed,
 13 May 2026 03:31:47 -0400
X-MC-Unique: M8ob-ZXROPOZrHCLAy5ceQ-1
X-Mimecast-MFC-AGG-ID: M8ob-ZXROPOZrHCLAy5ceQ_1778657504
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E827180047F;
	Wed, 13 May 2026 07:31:44 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3FE1818004A3;
	Wed, 13 May 2026 07:31:36 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 13 May 2026 09:30:54 +0200
Subject: [PATCH v10 4/4] kunit: Add documentation for warning backtrace
 suppression API
MIME-Version: 1.0
Message-Id: <20260513-kunit_add_support-v10-4-e379d206c8cd@redhat.com>
References: <20260513-kunit_add_support-v10-0-e379d206c8cd@redhat.com>
In-Reply-To: <20260513-kunit_add_support-v10-0-e379d206c8cd@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Alessandro Carminati <acarmina@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Dan Carpenter <error27@gmail.com>, 
 Kees Cook <kees@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778657459; l=2728;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=YX7AMC4Z3qCvd9o2GGoQ6LMsoUJS/dulVvDsXv5Qzg4=;
 b=Tn57dlpmAKPyg7EadtPF+8pvScnc6ZwMw7meNTlMqMCFlJZzy+pZI8DRncXP+P2iUjAiPDAsb
 jTdsNLlmNajD1NkYBoGSxviZ9mGmdnd11yBega+aY3NzzT34HItL/9a
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: wwM3H0eMgbp6jyYPu-1CZqx-7weEwwQgv3yn-Qf8Jvs_1778657504
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_083156_139646_00350C3B 
X-CRM114-Status: GOOD (  15.53  )
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

From: Guenter Roeck <linux@roeck-us.net>

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 Documentation/dev-tools/kunit/usage.rst | 46 ++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index ebd06f5ea4550..1c78dfff94e8a 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -157,6 +157,50 @@ Alternatively, one can take full control over the error message by using
 	if (some_setup_function())
 		KUNIT_FAIL(test, "Failed to setup thing for testing");
 
+Suppressing warning backtraces
+------------------------------
+
+Some unit tests trigger warning backtraces either intentionally or as a side
+effect. Such backtraces are normally undesirable since they distract from
+the actual test and may result in the impression that there is a problem.
+
+Backtraces can be suppressed with **task-scoped suppression**: while
+suppression is active on the current task, the backtrace and stack dump from
+``WARN*()``, ``WARN_ON*()``, and related macros on that task are suppressed.
+Two API forms are available.
+
+- Scoped suppression is the simplest form. Wrap the code that triggers
+  warnings in a ``kunit_warning_suppress()`` block:
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		kunit_warning_suppress(test) {
+			trigger_backtrace();
+			KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+		}
+	}
+
+.. note::
+   The warning count must be checked inside the block; the suppression handle
+   is not accessible after the block exits.
+
+- Direct functions return an explicit handle pointer. Use them when the handle
+  needs to be retained or passed across helper functions:
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		struct kunit_suppressed_warning *w;
+
+		w = kunit_start_suppress_warning(test);
+		trigger_backtrace();
+		kunit_end_suppress_warning(test, w);
+
+		KUNIT_EXPECT_EQ(test, kunit_suppressed_warning_count(w), 1);
+	}
 
 Test Suites
 ~~~~~~~~~~~
@@ -1211,4 +1255,4 @@ For example:
 		dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
 
 		// Everything is cleaned up automatically when the test ends.
-	}
\ No newline at end of file
+	}

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
