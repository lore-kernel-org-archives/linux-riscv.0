Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E412C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 18:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jKXWUPwSXywgkDsMhR/UnPbz+7Qq1dH6AiBpKvk8sUs=; b=p9Y/5nmr3JcoXM
	51JasGB/bBz2pIQEdECREk0Xa3fnFFZUBCfz0nbfelDg06XlinMgjkAoZKnCR7WLRCGKfTzeNA9U2
	zfCaW0520tuLciXvBKN1l0wSXAH5UAxLTFoW37ThGODNOy7GIrBIjM4rppWCu7zSHyiSYMAYLsuSc
	cvC6YVh0vSx1HZxn/BpKv2XU2HHNeoVs1TDSB4h2uCWvt/3sOrC4jMFENmfHksNEaY7hV/r+K3DjT
	IzDP7UcpPZbzm1J4ANvqHgd1hTCSMOONKWcWu54Np2vKswIYxAaTwzKVCALU1z4WHSJfZ6gu8RK6R
	QUlJ0CXBkbe3DLqL1oVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKlR-0000000H4mb-2kR0;
	Fri, 24 Jul 2026 18:36:53 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKlP-0000000H4m7-0Q3h
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 18:36:52 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-44856d185bcso542690fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784918210; x=1785523010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xIMot1+8eY40u8yqgZ7EMIZlZHJZl1g1JgeZ2DVZZSI=;
        b=aqSrAxVtWJJXnWZA+UIPxrSlSMy8vVC9xX8+fnjwiNWc/OV1AKmTzPOowt6lnVR5fF
         QFbfRGHoqak3aDyOeJr+NWJEIqiRu0DoJ1EU9PaqO6grOVeSCXlNzp4cEWlv8Cvd0m1w
         +B+9lh83LDQfjveK77I8LqxAt6SzL0j9yE8R1EcVLOwa+laYgsxMpon3ItylmEgF3C5M
         dQ/GUosfcymcVIMBtZYdxLebVXxIJNucK5aChOjVlt2wyK06dVXNznzjkPKw8BkYHTPA
         nMFeStZOm0eNhOlGblrvZ312GBbI4Nm9fdDzGK+o5eLvLygqmFJSpJ/xj8ex7On++Cq5
         reOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918210; x=1785523010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIMot1+8eY40u8yqgZ7EMIZlZHJZl1g1JgeZ2DVZZSI=;
        b=ddh6I1rImDLYtExPRtA6AJ1NF2Kzl0wvsE3OlIu+WwnR57JMr+uiU410q5j6aZmEBz
         AEO5V3GvORUn9EqBpvKnb4n6bwI90SrRDzGxT/Kz13c4pTHTO1Y1fPjpxv7vKkfn0pz2
         5H9/dNp9OzFtYkU9YunNll92oWxKszf72Ti8rD4ChENb65xcwGmgFbZ9X8IoDJrfVTqi
         1dWpeFTGooWhH0snY43j5zbeBucav8mNp5f5Wjc0YfK1PJTr9QnwPc3/KYNQNHo2oM3g
         6jHG9RaCbGXYgNMJ6SWeLewF3p0pZJzTHT7aqEIRmcwMjU1ALWrbJMyBHlmYnXEw64gy
         pujA==
X-Forwarded-Encrypted: i=1; AHgh+RqyQYq06sHtqyK5HJ8IFdLjbjsoIwn2b5GtcqeX5+0WHv2DVJ+SjoqmtVhrC8+azQ0jsau1GRjVAMusKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4npqHoQfzs0NB6axVPJhpX8imx1/7x4xVayrznFCSMK819x69
	EYQ6y3/Gizd+TwrZtsju7bgnKv6Lcz5TYhGYBt2EaETtUKwm6WAejORLEL51jok5qsA=
X-Gm-Gg: AR+sD11rMrh3t9PrDN5keTXsQcF8UcAY+ATXQtOeqVCJqRHqpVCdSkprItKd8V89W0I
	rtJza1MvgR+ld9Gjayvrw3DujQ88ckZLQJDNMyyOh67eJ53c8Gv79Q5fNK6VszbzFznaQjAHDGF
	ahaciNBfV/9RBqyZ/ntNNbC3SLzMwuGU03PPXFIv0maPD4Qp53QGTrJ1ljWG94y9KgwIKC/6A1z
	DzOMbo/vpc4EMt+krixwyScXbgkjqEkU7L2A6LsAW57C1r8D7IAuVegThfQT2bDeEO/buUaJ2lU
	ikMPFJSbbH9n/dm5N6tt99y4j2WW0DtTPXGR/NsHug3PRjyhsNDx12HDnk+s6LcgankVj/GzAgr
	eBzlWH4Go6pQWeLlC+HlA8V9flgMZJLHX72ID3oJJ9aN7/8eJkY1du80+mg3gy3vcueEkBuSmir
	IDZ+KCS9r81CP95wQ3tHiR4nKMtczDD5Lmnrl/RvT35j34XA==
X-Received: by 2002:a05:6870:e08e:b0:441:5c83:fbf0 with SMTP id 586e51a60fabf-457a0faf6c2mr5785469fac.24.1784918209628;
        Fri, 24 Jul 2026 11:36:49 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45767488299sm8221863fac.16.2026.07.24.11.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:36:49 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Cc: bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v2 0/2] riscv: hwprobe: report per-process extension availability
Date: Fri, 24 Jul 2026 13:36:26 -0500
Message-ID: <20260724183646.2363114-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_113651_149712_58561FC1 
X-CRM114-Status: GOOD (  13.67  )
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

hwprobe reports whether an extension is present in hardware, not whether it
is usable by the calling process. Vector can be disabled per-process via
prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), yet
RISCV_HWPROBE_KEY_IMA_EXT_0 still reports it. An IFUNC resolver that
dispatches to a vector routine on that basis then takes a SIGILL.

This series adds RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier:
within one request, keys before it report present-in-hardware, keys after
it report present-and-enabled for the calling process. Both views come back
in a single call:

      [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
          present       modifier       enabled

When V is disabled for the process, V and its V-dependent sub-extensions are
cleared from a following RISCV_HWPROBE_KEY_IMA_EXT_0, and XTHEADVECTOR is
cleared from a following RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0. The enabled
view is per-process, so requests carrying the modifier are deferred from the
vDSO to the syscall. Old kernels report the key as -1, so support is
detectable and existing users are unaffected.

The earlier documentation patch [1] clarified that userspace should discover
non-standard Vector extensions through hwprobe(2) and then use
prctl(PR_RISCV_V_GET_CONTROL) to check whether the process is actually
allowed to execute them. Requiring that separate prctl step is awkward for
the IFUNC-resolver environment, where a resolver wants to decide from the
single hwprobe query it already issues. This series folds the availability
check into hwprobe itself, so a resolver obtains present-and-enabled state
in one call.

Tested under QEMU (rv64, V enabled); the selftest passes. The disabled-V
case runs in a forked child that sets the NEXT control to off and execs a
nolibc worker, since V cannot be disabled in-place (-EPERM) and a
vector-using libc cannot run with V off. That check assumes
/proc/sys/abi/riscv_v_default_allow == 1 and skips otherwise.

[1] https://lore.kernel.org/all/20260107000609.63892-1-andybnac@gmail.com/
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220795

Patch summary:
 - Modify patch: 1
 - Unchanged patch: 2
 - New patch: none

Changelog v2:
 - Rebase on top of the latest riscv for-next branch (patchwork ci)
 - Hook test_avail into sifive's vendor vector extensions (Sashiko)
 - Link to v1: https://lore.kernel.org/all/20260723222109.2229089-3-tchiu@tenstorrent.com/

Andy Chiu (2):
  riscv: hwprobe: export the availability of vector to user
  selftests: riscv: hwprobe: test the RISCV_HWPROBE_KEY_EXT_ENABLED
    modifier

 Documentation/arch/riscv/hwprobe.rst          |  27 +++++
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 .../asm/vendor_extensions/sifive_hwprobe.h    |   6 +-
 .../asm/vendor_extensions/thead_hwprobe.h     |   6 +-
 arch/riscv/include/uapi/asm/hwprobe.h         |   2 +
 arch/riscv/kernel/sys_hwprobe.c               |  36 ++++--
 arch/riscv/kernel/vdso/hwprobe.c              |  25 +++-
 .../kernel/vendor_extensions/sifive_hwprobe.c |  16 ++-
 .../kernel/vendor_extensions/thead_hwprobe.c  |   9 +-
 .../selftests/riscv/hwprobe/.gitignore        |   2 +
 .../testing/selftests/riscv/hwprobe/Makefile  |  14 ++-
 .../selftests/riscv/hwprobe/ext-enabled.c     | 111 ++++++++++++++++++
 .../riscv/hwprobe/ext-enabled_nolibc.c        |  58 +++++++++
 13 files changed, 281 insertions(+), 33 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c


base-commit: 76e885f2b89d9e88291c1864e5f89a6b180768da
prerequisite-patch-id: ecac88d39cfd235fd3bd3be495124f8156f45c5f
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
