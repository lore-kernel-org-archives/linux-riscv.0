Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBEACAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 19:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=id2SAPG2qDMT4ncRVbSaFErRpTEwW/RmsdrgwRMFEic=; b=29adTZl1onU4Y1
	pit8RYoQOcziECfgrmsUwxQZBPEv6FNk5SpqaI7SJSmpj5lbqY/sQoSdePGTRKQ+zFhXju5Jz3IxJ
	gNZtDgpDm6JDioSHiUxhDdrlCRpfqQzUvltpGH1Qjm0DoJ4iVSLQBOEa5uVgISEB3aR+HiCWBe0QQ
	bdtrfRX0CLa3sHx9a9N9Qu0WhAMDEKs7S1pVpvxxbMVVOSi5bgBlnRdmtdGv7OwcqdRoAfNmARb4o
	Sj6ill7kN3YUA95rMeNNjuEdlpmvuGg0xBZ99iDUJtESTgS4VarB5se0/7rub5hiJACWs55AkPN69
	IUbCYBMVd7Zg0oiyj+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux9qF-0000000BJ5h-0Nim;
	Fri, 12 Sep 2025 19:53:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux9qB-0000000BJ4F-3X4k
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 19:53:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so20910955e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 12:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757706830; x=1758311630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=im9Lq21+8J5Mf+5Q2uEKKjoiHcxVE9gd6Lc8gRvhOVI=;
        b=EL9xIdmUd8GTQ0h2n74stM7aDZ5Uy0MebWKdOT+2zO/hWZ/ITxp/YcmFQRW6UWxX81
         MD42vWJQMSjClyTCeyahZC08+TM5ZntLRIguBHyOQ/NM8QpK8QMZQI65LH/FSBhk9iBV
         vXIAiyt6UxdkBvK1Nnsrfo8GDmFZG8GGOikEZIPmSfDzlUTM8g/48R4V815GhWOBt8Nd
         m6UtzO4I9ek5+28pLVvrsdEvDenfbwSz+gAz4rhgHwaeITbNOfBwiJXfa9KMUVgyxq1D
         hK58VlBorTVl6rahmjQl+At7p6nmDU+S2OfiENaX+Pe7N2s04sBxalBVDc9ckzO1OfIW
         pMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757706830; x=1758311630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=im9Lq21+8J5Mf+5Q2uEKKjoiHcxVE9gd6Lc8gRvhOVI=;
        b=DxLTlLeidFZAIeFf1Ipabcom9zz0hJrS+xqQSctnRlsqw0kM3pef7Hx1wfIgmB4d5g
         tfKwamWTAJF0Hh1rkRpzw7sQvgfY2gc7zbkx8wTBuJGB8InVXXV1z8dEuj9BffKxrN61
         w4j/nQHIUGM/xc+kkM7IgoVSRvUme+HyEmSLSrLFHUzdgvwg5TOW7YNBZZwOTuTHRy2R
         rGg2GqF4tUYQnc54cKBIPkq7/iKMvdLlhjFeQjeuQ9BBkgtbIRjqBua1AKse7y+bOqx+
         YeLSZj5ydSBiRJ25mropT2AbZdaa3r83Qg0+XXU8fbXy6qLmPH39xoTGBLV647HSV0jV
         BObg==
X-Forwarded-Encrypted: i=1; AJvYcCUcTzM0A3Vfu8vLnQXasr5bKo6+JDp77Kri9xdouqu735uGQMcYKien3EBi7amy4e3CklSpwtA18rC9hQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwNyoOdOCqku/AVUWzW1P6KCj6jAnutqn0RBNLr3jx3UNtGzMd
	zH29EwWRuvR2DehJC3lUs3gkVMMChDkVdmzLvsP36bNRs3eDGqYDl19h
X-Gm-Gg: ASbGncsa57ISJS2UhPcaLq+9mPX1AF9FZn8Zgt7Pi9SaBhEyFr0AIgpCqinsAjaYWXj
	rXZvGdcbMGYwsubHC72YkGSXBzj0kXc0j8ZvN5YJBPIGfIv4t9ak/AOJNSnEnWv+TuDgCdIVyYK
	RDS7+9qun9p1ymQKQZ84YXMpFCK+9+875a53xlCGhdDv3lC6vjDesoEuamlSUZ9WRZ5izosEdi5
	vINquCYtxRWxo0aNrT1X4SFROk8sLC9W2Gg/WgZAoL4qLrvmktfjhDk5Wcq+yXK5pQoVhgPtS91
	pXF9R8wEybfBJSSH7mdIjUyP6WobfFQyToviX+3O03yNA/iBz6+iYN+Y6knlFTotG896yJKA54O
	Ww62aYOebri0lSIRDvifnp/Il8jJWSuYoOl3i0pb52PdCY8nCXf1O1ptu/HbSSA==
X-Google-Smtp-Source: AGHT+IG9aZcd6e5qxsZVmaWzgC1SbVThJULp4P95JK54XvdW/IaMNxg/kygFEwGzo4IyxjxCygpjwA==
X-Received: by 2002:a05:600c:898:b0:45f:21e6:3ef7 with SMTP id 5b1f17b1804b1-45f21e6403bmr28589515e9.17.1757706829510;
        Fri, 12 Sep 2025 12:53:49 -0700 (PDT)
Received: from yanesskka.. (node-188-187-35-212.domolink.tula.net. [212.35.187.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017bfd14sm74650375e9.21.2025.09.12.12.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 12:53:49 -0700 (PDT)
From: Yana Bashlykova <yana2bsh@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Yana Bashlykova <yana2bsh@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH 6.1 00/15] genetlink: Test Netlink subsystem of Linux v6.1
Date: Fri, 12 Sep 2025 22:53:23 +0300
Message-Id: <20250912195339.20635-1-yana2bsh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_125351_916032_0B977B84 
X-CRM114-Status: UNSURE (   7.97  )
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

This series adds comprehensive testing infrastructure for Netlink
and Generic Netlink

The implementation includes both kernel module and userspace tests to
verify correct Generic Netlink and Netlink behaviors under
various conditions.

Yana Bashlykova (15):
  genetlink: add sysfs test module for Generic Netlink
  genetlink: add TEST_GENL family for netlink testing
  genetlink: add PARALLEL_GENL test family
  genetlink: add test case for duplicate genl family registration
  genetlink: add test case for family with invalid ops
  genetlink: add netlink notifier support
  genetlink: add THIRD_GENL family
  genetlink: verify unregister fails for non-registered family
  genetlink: add LARGE_GENL stress test family
  selftests: net: genetlink: add packet capture test infrastructure
  selftests: net: genetlink: add /proc/net/netlink test
  selftests: net: genetlink: add Generic Netlink controller tests
  selftests: net: genetlink: add large family ID resolution test
  selftests: net: genetlink: add Netlink and Generic Netlink test suite
  selftests: net: genetlink: fix expectation for large family resolution

 drivers/net/Kconfig                           |    2 +
 drivers/net/Makefile                          |    2 +
 drivers/net/genetlink/Kconfig                 |    8 +
 drivers/net/genetlink/Makefile                |    3 +
 .../net-pf-16-proto-16-family-PARALLEL_GENL.c | 1921 ++++++
 tools/testing/selftests/net/Makefile          |    6 +
 tools/testing/selftests/net/genetlink.c       | 5152 +++++++++++++++++
 7 files changed, 7094 insertions(+)
 create mode 100644 drivers/net/genetlink/Kconfig
 create mode 100644 drivers/net/genetlink/Makefile
 create mode 100644 drivers/net/genetlink/net-pf-16-proto-16-family-PARALLEL_GENL.c
 create mode 100644 tools/testing/selftests/net/genetlink.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
