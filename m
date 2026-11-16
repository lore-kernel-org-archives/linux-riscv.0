Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1765606A336
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=diqx9XiN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EzhNnm28
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qmBjQ8WRMFVM4/EW8JBLGix9lj+sk0YtxA3Fu9SxTN4=; b=diqx9XiN8InS9wFhykjAUBbWj3
	ZocuBlafAQHYjh3J9VHWDlwfOR9kXfDWZewr269Qc8mny1GlLLXOKBnEOIxwLKU4C07KV44vk5XuI
	LN/u8M5/vYOBRkcmgweCPyVMHI/m/VUNCdznmY/wF8twthn7Mt7dHo4YSp15XqA7o2EtsgQXueiyr
	/y3pXzpH/SRu+upMwyqiJ3QHCb2t1wGBx5d6R0vgg566BDNgVP6OwA4qNOIOuk6SH3HZwPP3kDTEx
	f3xc5FNNdNRfH+EwUcCfHEjhP9Jeo7fHVOc7oQ4qdihBOCuOK3rSBHvna2+BOUDB8+LB1J/kUOJPA
	sQSXFliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqui-00000001NAM-3ReG;
	Mon, 16 Nov 2026 07:14:04 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSquf-00000001N8n-0ykh
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:14:03 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-37071c0f42aso4570784eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 23:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794813236; x=1795418036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8CsXHXcl/CTMGZ0Vc+K3+S7p0GgqWl5r8v3bGSKHol8=;
        b=EzhNnm28METKjd4aliJzpkP6KjcHiAXJPAvkO6ZE/1B7fTRzZSv/pcoJbGIH5SCtTr
         CqHkzTGoamura2OEaF8ay1Pa5dZf0iw04RxfearL/YW+WswJ1X21WtwI4IhJD1WG9nFu
         lOWk8ZjY4C3Bn6Bu6FFHeShKwNKbzjOG9Jj+l8w9knhCce6d0O/2vvaaJUg5a7AAUZn1
         Ql9apR335MF9W+YwZ+eWf51U/6ybibCDR+gu/5B9oRvp27yqJntDpEkICtaQoIAjbh63
         dn/G1MXWRy/Vz3eI/uncxs4q4MVin5+1UmQee/xIGaq5fqPbgjG1RENZ5o5cqj27lTng
         Meeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813236; x=1795418036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CsXHXcl/CTMGZ0Vc+K3+S7p0GgqWl5r8v3bGSKHol8=;
        b=grbnkoCthue3bXOR3THLQeOUoTy3eF745QuX1Ys/KPwrjPA7Ak3W3DkXS8UIX51fLB
         QiaksOeJd0TX+fyX3vGMd7hnTWSQlhAFx9NXEkpXZ93S2ZUmzaVZtdvYbFR1WQSaW2dz
         z/SClvoUGfTdC7+LSkgCAlepEOFsAxr09AcS0R7DTdz+OdJ76Cqcc8klj+QTZBkfniPb
         xiT7J5GpZLbJu9I2jkaktJN7hiswXUKD7mfuJOuYGOksbmLa1nQ9eRqSPpj5d2l5T2Ay
         0Og/fczOXNPB5A9RtbxhtfCfiNF4j0k5qUkO7jBLxkWfYCnlq28meRCfAp0+VF3KErd6
         VBHA==
X-Forwarded-Encrypted: i=1; AL+hErGw+xzUUh1j/e665wkHjvvDu0ushVd5VFpdfPV5FVZGTFo4tr65MgtMPMQvztxUZWkVkaShpkC+rBr80A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/or2iDL/gTO1u1MuYX5dCLghMf5Vedqjtmivt4LSUW4QT0HqIF
	YuBCqUi168PcdgjwfTLgsBRremGPw9+Q2jFG9s7SsbGiK6MbmVtlFJ4/q4xctMLkkag=
X-Gm-Gg: AYBFou30KGwk5UO4XnDzcBBEecUNXVuIwus78aDB56xg/zVKNS8NViB+cy8dE9aH7YB
	/MCVkbyRWjYnso3I0yabR4i2phVhRzBL0v4xh1sJoL5W09pppANl1YBNh/IGNWwBI+ucu1hDjda
	boZWhF51kA2IdIU/vGlfj0kImI98HXBglKarGyVkgM32UCrRKOVN1O7xVSp6UUVM4EJx+5QYhjQ
	o7+5mDOybcSiMe+66TMxUlaZe1goJBDepL7CNCL5xI87t35jmFW1iDjfdQf2y+0naMDRkSKnj1N
	eVpmz37FZh4471YP6h0U0s1aVISkR6W/WyoZZEy8ttLZynxoYAGul14yHuFQ6wPZ8f6zpFDLQ+x
	OcDqxUL+G084iwAFaOCViUsfcOi0oPmQMw3EpResWJ13UUAaGDKLRs3DpzWUblzhlfO/wnhkAO0
	GefyO71FYUGS8KOAk8Lh7Af57dUBI2uj2B+WdQEJWnBDU2Ngx4G127gxw0iJx/C4EMYf4I2aON/
	8A/8gKzi54K/l2XVkArW5B1hlWy60AhSPcgadLHkPiAk46DyN/Lxj7ww8F2PQueBT2xHvd/fBqH
	5Odt4I/LAfoJIkMwWQDEkdwbSUxK+lYZgfAjMxQpsnL2ZnwFQbZpm22ccnkViFhBA8wrrAy+J/x
	GDI1D3Q==
X-Received: by 2002:a05:693c:8813:20b0:376:77e6:a66 with SMTP id 5a478bee46e88-37967315a29mr9334631eec.16.1794813236238;
        Sun, 15 Nov 2026 23:13:56 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm47858505eec.8.2026.11.15.23.13.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:13:55 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: fustini@kernel.org,
	jgg@ziepe.ca,
	james.morse@arm.com,
	ben.horgan@arm.com,
	xiaqinxin@huawei.com,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	babu.moger@amd.com,
	kevin.tian@intel.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	randy.dunlap@infradead.org,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH v2 0/4] resctrl: Assign registered devices to resource groups
Date: Mon, 16 Nov 2026 15:13:39 +0800
Message-ID: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_231401_526395_2D11C4C8 
X-CRM114-Status: GOOD (  15.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This RFC lets resctrl groups include devices as well as CPU tasks. It
uses the RISC-V IOMMU QoS ID extension as the first provider and builds
on Drew Fustini's CBQRI resctrl v12 series [1] on Linux v7.4-rc1.

RISC-V QoS tags requests with a resource control ID (RCID) and a
monitoring counter ID (MCID). On successful translations the IOMMU
supplies the device context's IDs to the I/O bridge for device requests.
Those IDs also tag IOMMU accesses to context-specific metadata, such as
page tables. IOMMU accesses to the device directory, queues and
IOMMU-generated MSIs use the per-IOMMU iommu_qosid register. When the
IOMMU is in DDTP Bare mode, device requests use that register too.
The IOMMU supplies the tags; downstream controllers apply the policy.

In v1, the unit of assignment was an IOMMU group. In v2, the driver
responsible for tagging explicitly registers supported devices with
resctrl. Here that is the RISC-V IOMMU driver, so endpoint drivers such
as NVMe do not need to change. Common resctrl code handles token
lookup and group membership. When a device is assigned, resctrl calls
the driver's set_ids() callback to program its device context. The
devices file remains separate from tasks.

  resctrl control group
     schemata  ---------> CBQRI controller: resource policy
     tasks     ---------> CPU:              task IDs
     devices   ---------> IOMMU:            device context IDs

For example, for an independently tagged PCI device:

  mkdir /sys/fs/resctrl/p1
  echo pci/0000:00:03.0 > /sys/fs/resctrl/p1/devices
  echo pci/0000:00:03.0 > /sys/fs/resctrl/devices
  rmdir /sys/fs/resctrl/p1

The devices file appears only if at least one device is registered at
mount time. A device being present in sysfs does not make it assignable.
The IOMMU driver excludes shared hardware contexts and requires known QoS
ID limits before registering a device. It probes those limits only with
DDTP set to Off and all queues disabled and idle, and rejects out-of-range
IDs before changing a device context.

The separate qosid/{rcid,mcid} attributes under the IOMMU class device
configure the global register independently of resctrl.

The v12 dependency provides cache capacity allocation, not monitoring.
Nonzero device MCIDs require a monitoring-capable dependency.

Changes since RFC v1:

  * Assign devices rather than IOMMU groups, as Jason and Qinxin
    suggested [2]. Drop the IOMMU core group lookup and walk helpers.
  * Build on James's driver callback suggestion [2] with explicit
    device registration. Handle token lookup in common resctrl rather
    than in each architecture, as Drew suggested [3].
  * Keep devices separate from tasks so the existing ABI stays
    unchanged [4]. Following Drew's runtime visibility suggestion [5],
    check for registered devices at mount time.
  * Split the global sysfs setting into separate rcid and mcid files
    [6], and introduce qosid_lock in the patch that first uses it [7].
    Thanks to Drew for both reviews.
  * Rebase on CBQRI v12, check implemented QoS ID widths before device
    assignment, and test task and device membership in the same
    control group.

Feedback would be particularly helpful on:

  * The provider registration and lifetime contract, including how to
    represent devices that share a tagging context.
  * The bus/name token versus using an existing sysfs identity.
  * The scope of protection after a command queue failure. If an update
    leaves the hardware state uncertain, the current code prevents ID
    reuse by blocking group removal and future mounts, including for
    groups unrelated to the failed update. Would reserving only the
    affected old and target IDs be sufficient?

PASID assignment and recovery after an uncertain hardware update are
outside this RFC.

[1] https://lore.kernel.org/linux-riscv/20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org/
[2] https://lore.kernel.org/all/arKx__kOPe4B5gDW@agluck-desk3/T/
[3] https://lore.kernel.org/all/an4CRRXt44%2BPhHgy@x1/
[4] https://lore.kernel.org/all/7cf591e8-e182-447f-9808-d8e328d28f79@arm.com/#t
[5] https://lore.kernel.org/all/anvYGuNF3MC%2F%2FQ94@x1/
[6] https://lore.kernel.org/all/andiub47zsUsL4qh@x1/
[7] https://lore.kernel.org/all/andiWrKhz5rLPVuq@x1/

Zhanpeng Zhang (4):
  resctrl: Add registered device assignment
  iommu/riscv: Register independently tagged devices with resctrl
  iommu/riscv: Expose global QoS IDs in sysfs
  selftests/resctrl: Exercise device assignment and IOMMU global IDs

 .../ABI/testing/sysfs-class-iommu-riscv-iommu |  27 ++
 .../filesystems/resctrl-devices-prototype.rst |  43 ++
 MAINTAINERS                                   |   8 +
 drivers/iommu/riscv/iommu-bits.h              |   8 +
 drivers/iommu/riscv/iommu.c                   | 398 +++++++++++++++++-
 drivers/iommu/riscv/iommu.h                   |  16 +
 fs/resctrl/Makefile                           |   2 +-
 fs/resctrl/devices.c                          | 233 ++++++++++
 fs/resctrl/internal.h                         |   8 +
 fs/resctrl/rdtgroup.c                         |  28 ++
 include/linux/resctrl_device.h                |  53 +++
 tools/testing/selftests/resctrl/Makefile      |   2 +
 tools/testing/selftests/resctrl/devices.sh    | 205 +++++++++
 .../testing/selftests/resctrl/iommu_qosid.sh  | 119 ++++++
 14 files changed, 1143 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
 create mode 100644 Documentation/filesystems/resctrl-devices-prototype.rst
 create mode 100644 fs/resctrl/devices.c
 create mode 100644 include/linux/resctrl_device.h
 create mode 100755 tools/testing/selftests/resctrl/devices.sh
 create mode 100755 tools/testing/selftests/resctrl/iommu_qosid.sh


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: 492fe81aa4f3c885ac5bb48252def2fdc5527275
prerequisite-patch-id: b4f0bd4bf660c92dbf4ca0c7d871c1550b66df0d
prerequisite-patch-id: a2e36f0788f8e11c708d162dce653351dd99c4f0
prerequisite-patch-id: d1d359c5cf89b2b5018d64ca8f320892f6dbcca2
prerequisite-patch-id: 5b7fea6f1ad8f2137ffe45681d56b83e17f7cb2a
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
