Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE91CCD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 06:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUlfhBiyORnel59LdBKWxujFTo61W6myBwuWr4cN/vo=; b=pHC/rWagG1krxM
	dUxeXPuGJaR/EoCzC9PbUyMhGXYb7w1/HKr/xHBTtJSQyB0STpiPBsX+ZxIBBvH2r/6+h7bWe99sa
	vqKXDwYDNUeGW3MKYGJvMUXI2SgCMa7v+tsnEQ+2Zt97OYfmfGLQ04LZlVzaqaPyhwoYTlXIr+0Lt
	c7NWFgNnuqWCdbXTuYJ9ctyfnCPrzT2Y44ihSbhfkhWqTZtpL/IoE89iKYVBvIScT435FE9+uTj6A
	rXGeEi1OA0P1gBGUol11TJJnwO+kKcdi5wMyNOtUbDs0fKeUf0TMURe2O3cLsjKS0z1kY+gIFlc8h
	rsBo+WzVAW4vuFAoa35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2pt-00000001Pef-2pkU;
	Wed, 13 May 2026 06:12:49 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2pp-00000001Pe7-3qBz
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 06:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778652766; x=1810188766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8/g0tgr/8x4vCKR3FY6O1wuKpyVe59KewQCyaI/CkQQ=;
  b=VEDpkUeWfbefmGze2MvTkpd497gn6bEhnhZ5xkQ/a+/JA/kAJlqYfpc6
   YZpbpZEyjWpgIS3B6LrkmAR5/UtJrdzbkT3PgDBgmM79NmwILQ6XKxjOr
   PJL5AnhVeZBVx88LgJ4ugbJ5k4wd41xtjlSb2fn2n5icTLmuFJvbAHCME
   IYkZ25QIKp41iUpOlj5oZZdBpDkzMdVDmmzEfoo0Tnxs7u5x/T+UqoRVT
   e+dB4Vf1oB25vtJkOuYOv8jyVecYUlgqZR4tO2AodBwN3tvcW8+g1EQEI
   HOcU2bkoDyYbFD1BheWZrX2A/XFmch9s3UHJjxjHk9+C0mRhuRBisK++v
   g==;
X-CSE-ConnectionGUID: pZoyKNjCSQC2cUH3vBVZhQ==
X-CSE-MsgGUID: rMQv9E9cS6iGtKkB+9HLpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90955031"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="90955031"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:12:44 -0700
X-CSE-ConnectionGUID: 2i93/dl6TbWCCX0UwefHBA==
X-CSE-MsgGUID: phmejI5KRIS5n9pT4+TNMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233713261"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 May 2026 23:12:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN2pg-000000008UF-2M6L;
	Wed, 13 May 2026 06:12:36 +0000
Date: Wed, 13 May 2026 08:12:05 +0200
From: kernel test robot <lkp@intel.com>
To: Albert Esteve <aesteve@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Dan Carpenter <error27@gmail.com>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: Re: [PATCH v8 4/4] kunit: Add documentation for warning backtrace
 suppression API
Message-ID: <202605130826.e6Lyyytr-lkp@intel.com>
References: <20260504-kunit_add_support-v8-4-3e5957cdd235@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504-kunit_add_support-v8-4-3e5957cdd235@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_231245_979339_AEBFF645 
X-CRM114-Status: GOOD (  11.35  )
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

Hi Alessandro,

kernel test robot noticed the following build errors:

[auto build test ERROR on 80234b5ab240f52fa45d201e899e207b9265ef91]

url:    https://github.com/intel-lab-lkp/linux/commits/Albert-Esteve/bug-kunit-Core-support-for-suppressing-warning-backtraces/20260513-043807
base:   80234b5ab240f52fa45d201e899e207b9265ef91
patch link:    https://lore.kernel.org/r/20260504-kunit_add_support-v8-4-3e5957cdd235%40redhat.com
patch subject: [PATCH v8 4/4] kunit: Add documentation for warning backtrace suppression API
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260513/202605130826.e6Lyyytr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130826.e6Lyyytr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130826.e6Lyyytr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_buddy.c:6:
>> include/kunit/test-bug.h:90:15: error: unknown type name 'bool'
      90 | static inline bool kunit_is_suppressed_warning(bool count) { return false; }
         |               ^~~~
   include/kunit/test-bug.h:13:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
      12 | #include <linux/stddef.h> /* for NULL */
     +++ |+#include <stdbool.h>
      13 | 
   include/kunit/test-bug.h:90:48: error: unknown type name 'bool'
      90 | static inline bool kunit_is_suppressed_warning(bool count) { return false; }
         |                                                ^~~~
   include/kunit/test-bug.h:90:48: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'


vim +/bool +90 include/kunit/test-bug.h

    88	
    89	static inline struct kunit *kunit_get_current_test(void) { return NULL; }
  > 90	static inline bool kunit_is_suppressed_warning(bool count) { return false; }
    91	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
