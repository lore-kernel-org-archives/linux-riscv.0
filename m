Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF94CC9EC82
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W3N1CQP+4DeL5Xv6KvLU8I5ycQUAQ570NbcuVK7oMvE=; b=qAD1x8LYBXGBK3
	vs2ZWQIwrantMPpCiZUbqipfVwmUSPFfQX3d3hOBvnIs2+ZgNMc+oBgKKRpVtI0maIqoSYHDDfIFo
	4NY4RW9qURsaJV2UVBKtFI17Uh7U0UV2g7kDjFEyIF2zIed3E2q3j71QpAmDma5h/1q/Q1NizrY2k
	PwDPf0UbI9VhNy5hZ/6D+641BA3Ra0uzPzHUBo/B9fJ0uxsZ7IkDa52FfGL+y1HiOcElR7TlYWpdD
	kSAatYMIiF+Hj7LIrqqKbjnni5dxG0UQzPG5YoWle8ri+TFbq3dci1PZScEku/dgGDZIXlDQMjgeS
	601yoMTLUIl+NIYKU0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHSH-00000005MKZ-0WlR;
	Mon, 12 Jan 2026 12:55:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHSE-00000005M7O-1u4A
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 12:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iKF0BzHe4DoMZWSEsankET3G7Dd2Xauwml8GRRGytpc=;
	b=ExAuEuAcsD1oiA8r9Yl7BNekcNgkIKmQtIE8zH9/BypO8czs/3fY0SNw6a79zW5e+xjikT
	gu/e5Ty8DvhTaBun7GfH/D/Nr3gHR+xVD/+UMBPiuInl9d+gct7Y3X/WwQsg5ySZSwa6nq
	qp0XX+QhRSf1rNwuaT/I1kL7AssxDdM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-z8be0owqNA6Hguu2rahxjQ-1; Mon, 12 Jan 2026 07:54:42 -0500
X-MC-Unique: z8be0owqNA6Hguu2rahxjQ-1
X-Mimecast-MFC-AGG-ID: z8be0owqNA6Hguu2rahxjQ_1768222481
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b844098869cso649593066b.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 04:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222481; x=1768827281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKF0BzHe4DoMZWSEsankET3G7Dd2Xauwml8GRRGytpc=;
        b=qNVNtf5+QmHunBBgHPxBekDD9Jk1Rdm23usI6c14kcN/TaAm6PtPO+SyOKTqDYJbBs
         WMtRg83a9GWoZpOjUdId7O0EWwqxLSjJGxKMz/PfW7k4nQwz1z4aBg1lHDB5ag+Yajbb
         F7PVgEiU03qFwGhyuSWkXmw1bAXSwDXDZ6XNxU00YWlFEDCKSVU3pjTDjKrQoI7voz3p
         a6rbNzqeZVoh6+Bc1kIYbHXxci06gcSN5XcPwVEMHb/F/T/aoRkNXLg0MnfIMZxtwDMo
         y1A19tq7K+5oN7NwNMFb47hw8EVyjKmfutFzZkow8DxyyrklY1qyIwQ7NwbE9CDKs9IH
         l1FA==
X-Forwarded-Encrypted: i=1; AJvYcCUTjHMEELrEHiG/lPZ+BD9BUo+guDm5kbChUOfkOORupCHZEv8FvykUwTwg5dmkx6vC6gm+c8VWcse+4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpMDPWDOZ54awYcoLnDAaepsd3IBYDVZJG7BS9W2UW5M5Ki+80
	IdPt4UDVqRYx/aDRRrQxcCb2nAaNHBM/IFZtQLbiG/usxlHn+qItkOUXLT8VqHoWYfMX4WjkQ38
	nQJMqVeH5mOMlQwFkc5JJCWv96NBR7c2ZdEaUiNBjfL70bCBRyPG6fvQLTuZfC++AmTMxhg==
X-Gm-Gg: AY/fxX6O0qnhKQPC+RM6xIb5ds48cVI63+lWvfFXGELVy8vQ2CjqjBlJaXRy+ktoNbL
	zXhA5PtSNqV9cAEyOhq3l9dgV3QMiKud/4l2nrkhSd2Ckf/XqrHBtPiBiqCZkhzUpIAtHxsv70B
	AQVzftFXjYJfCM6hhrSJIqVeUcoGx+ZXXmlLUn243QlZNHHFXkZ3vAa62Q3G2PAh9acgt02F204
	ewWZMj2OiGRHyJNIKKs6YiIRvKsNa3ePQu8xBrRiUkIMg2ZD9NSUad/QP78bJS+ro9q6ZxHUfNY
	ZnVL1K+dKfxDty3gI6kXFrGU8GRwZuxpqWFhpasyuM0lF6BBZELILxJGHujt0v9ensxCoQq3kSS
	gqWwjamqdEXtQSQqMt2lW+/pxiM6JokN+Ik8GPnpgBrhmMdi7sY4kYbGSuiU=
X-Received: by 2002:a17:907:a4a:b0:b83:8f35:773b with SMTP id a640c23a62f3a-b844501e49emr1772457066b.54.1768222480786;
        Mon, 12 Jan 2026 04:54:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSZz6AlBAsyDbYMyXJssyt5r14tT5j/dhOjPD0uwwtT32eYJd5F4wjSbE4zxf083DcjrlpEg==
X-Received: by 2002:a17:907:a4a:b0:b83:8f35:773b with SMTP id a640c23a62f3a-b844501e49emr1772452766b.54.1768222480270;
        Mon, 12 Jan 2026 04:54:40 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:39 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	David Ahern <dsahern@kernel.org>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-s390@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [RFC PATCH 0/5] net: make config options NF_LOG_{ARP,IPV4,IPV6} transitional
Date: Mon, 12 Jan 2026 13:54:26 +0100
Message-ID: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l9BEFZYVmYoTPkEXg8IfPqM56xRcefTQUW1QiFHyPIM_1768222481
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_045530_565996_5D40E339 
X-CRM114-Status: GOOD (  23.04  )
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

Hi,

This RFC patch series makes the config options NF_LOG_{ARP,IPV4,IPV6}
transitional. Recently, Kees Cook added a feature to kconfig to assist
transitioning deprecated config options. Here is a first RFC patch to apply
this feature for NF_LOG_{ARP,IPV4,IPV6}.

The plan is to mark all deprecated config options in net transitional, and
update the kernel configurations in the kernel tree to not use those
transitional config options. Then we leave these transitional config
options for a year or two to allow users that only update from one LTS to
the next to see that these config options are deprecated. After such a
grace period, we can finally drop these transitional config options.

This patch series is the manifestation of that plan for the three
deprecated options NF_LOG_{ARP,IPV4,IPV6}. If there is general agreement
that this is how deprecated config options are to be handled, then please
apply the patches 1 and 2 to the net-next tree.

Note that for the time being, as there is no dedicated kernel-wide Kconfig
file for collecting transitional config options right now, so simply adding
them at the end of the net/Kconfig file seems the best choice for now. 

The patches 3, 4 and 5 are added here to understand the complete treewide
change to transition the deprecated config options; I expect the patches
3, 4 and 5 to be applied by the corresponding arch maintainers, though.
Note that all patches in this series can be applied independently from each
other without causing any regression, i.e., if any patch 2 to 5 is applied
without patch 1, the resulting kernel configurations still enable the same
functionality as before as well as with patch 1 applied.

Once the general approach and patches are accepted, I plan to send some
further patch series to transition more net config options. My current
investigation identified that these further config options in net can be
transitioned:

  IP_NF_MATCH_ECN -> NETFILTER_XT_MATCH_ECN
  IP_NF_MATCH_TTL -> NETFILTER_XT_MATCH_HL
  IP_NF_TARGET_MASQUERADE -> NETFILTER_XT_TARGET_MASQUERADE
  IP_NF_TARGET_NETMAP -> NETFILTER_XT_TARGET_NETMAP
  IP_NF_TARGET_REDIRECT -> NETFILTER_XT_TARGET_REDIRECT
  IP_NF_TARGET_TTL -> NETFILTER_XT_TARGET_HL
  NETFILTER_XT_TARGET_CONNMARK -> NETFILTER_XT_CONNMARK
  NETFILTER_XT_TARGET_MARK -> NETFILTER_XT_MARK


Lukas


Lukas Bulwahn (5):
  net: make configs NF_LOG_{ARP,IPV4,IPV6} transitional
  selftests: net: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
  m68k: defconfig: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
  riscv: defconfig: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
  s390/configs: replace deprecated NF_LOG configs by NF_LOG_SYSLOG

 arch/m68k/configs/amiga_defconfig            |  3 +--
 arch/m68k/configs/apollo_defconfig           |  3 +--
 arch/m68k/configs/atari_defconfig            |  3 +--
 arch/m68k/configs/bvme6000_defconfig         |  3 +--
 arch/m68k/configs/hp300_defconfig            |  3 +--
 arch/m68k/configs/mac_defconfig              |  3 +--
 arch/m68k/configs/multi_defconfig            |  3 +--
 arch/m68k/configs/mvme147_defconfig          |  3 +--
 arch/m68k/configs/mvme16x_defconfig          |  3 +--
 arch/m68k/configs/q40_defconfig              |  3 +--
 arch/m68k/configs/sun3_defconfig             |  3 +--
 arch/m68k/configs/sun3x_defconfig            |  3 +--
 arch/riscv/configs/defconfig                 |  4 +---
 arch/s390/configs/debug_defconfig            |  2 +-
 arch/s390/configs/defconfig                  |  2 +-
 net/Kconfig                                  | 21 ++++++++++++++++++++
 net/ipv4/netfilter/Kconfig                   | 16 ---------------
 net/ipv6/netfilter/Kconfig                   |  8 --------
 net/netfilter/Kconfig                        |  1 +
 tools/testing/selftests/net/netfilter/config |  3 +--
 20 files changed, 38 insertions(+), 55 deletions(-)

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
