Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31497EE6B4E
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 03:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WyBvFlqL5rGKT8rnNAodoV/8JVwwMsh9hlscgF40pLE=; b=2CU9eSlneF6c7L
	yWOyM0TwFWjHRNVhrKmziigoXjpMo8CjSKqbYg/CsXIsra+guLas4ZhVPULMqc3j12SYGvGRrATTW
	cYMPSQ/r1Ek8WJo/c9qKy7LlN2TFnjNIyPH+ELy8zYD/1qQa39Txsg6I4+XTOmgXqGIy9GLfF82/i
	G6GwT98TIMXysd+2yC8+8M8RyISFK36jmcrtrvWDEyiB8T7f6dGyK+h4ApESGpKRUUlNPsC2ILy0R
	Gp69TboUWICmy/fa3UNvMB1M1ZH92e3HHk6N6izu6QnaVf/0lsrKsaYF0TWm1MCyYRFrrIgcl+KRC
	hrOl2VZ+/gQdsDOoroUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voYsy-0000000C4qw-2BxM;
	Sat, 07 Feb 2026 03:21:28 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voYsv-0000000C4qH-2t91
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 03:21:27 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-66a12c77a2cso1561510eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 19:21:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770434483; cv=none;
        d=google.com; s=arc-20240605;
        b=Elc+pm5VW6U9fkfrG1WtOedbLyWTjE+/DNLPN4WqMPZRwcyVDsVYIOnxeFMzDBoTh/
         9b3HIAsakbcvyO6jQZVH6a0K6/dCEM61OvbzQZO8dBxJonSuepaQDORk8SMrVNxtxd0e
         kktHX3TzzVhUWUJSdRiYaYNAi/zfhArWS9oUNb+zeKGfFYOtHwTnfoAZX7zkTwRYM/FX
         YdeM00fTQ1fye8Dkp0xBkM7GHBGgLOnh9td/BjL6cUTPzm5P115uf9MtvF5fEX36BCf6
         ptoRLY+fOVO5NOgORTYqvhnLzhxbfVUrWOAoJKkeP93mZBq528Bnt5Nqg4JHmSGAFxEM
         ZdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DDnvhXep83DlBOrKWoBYx9m4Ze6xzsCfCU7TNyv34F8=;
        fh=5ICUUZRx7Q0G+fcZyG0tNjPaLmZTgP+/rLYcjwjgfW0=;
        b=Fz+MycbvxNH/ro43aCkl4GEN5Akrhcba7EDWDufbOtrshOnsiWXq3Lt7GMaa/igQ1t
         riPFQ7Ys+OxU1Itxycqjs5nKO3SSkxQQhJFBvhaihXKPfGJaT2CjUgOC6x6h9VpWirBh
         KVc+SmSnpgon2vxKp0xoQa8j8myk/4QPmQtSAIlOxlAPpkp/SwIxBdkgFxh/w+tSPTQR
         LXIdX9uN2cogImAbF3xrN20sNRLwEYiMxrcWnxuSs3QXJlSaA1A5Sly0sBOhRXK/eu9V
         mBgvbh/vhzs3XWp26quQKuANfBoytq+zScVNtg3By3iSQ41sTE5DOQZrwtrMX3ssgZJu
         rD0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770434483; x=1771039283; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DDnvhXep83DlBOrKWoBYx9m4Ze6xzsCfCU7TNyv34F8=;
        b=3Spdo7iMpZ8C0xTfCubgMczFUV4l3TRjATUbz97SVBEdbpEEwHpVgaWGIWk3Vzzgvt
         Ly9Zk15IKPQZkzTM77Gdo6qTatxOwo19mKZBxV4DUb3dqNybFAn4438O7G6a1cewl4Mj
         e2d7NcnmRSF8XKSIDB1t/0yEl7jKqWdzri811oRnsvhnRu/pgWDtYUhKOdmp+t7fURWM
         uRfH4hR57+SGq6GJZ2LFYcksQTMJf3/6Zq17VZT70q5b8/09CMGDtfU91kZNxE4UTpw8
         LAVvHjy9+xGE1um4NuZlaPPTYtE8zxM3hZpvwkwAPq4ksVF2H4fzLihblw6VWCSJI4iI
         i5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770434483; x=1771039283;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDnvhXep83DlBOrKWoBYx9m4Ze6xzsCfCU7TNyv34F8=;
        b=TiEr7fQqFtWPjJUy5cgB1Y8sAhorpeIEmmd6HvvUWlcBtTk4r9Ti83xY98XeJK36d8
         C9yX0g4NxOOuI5sWY9F8xxXHloW/0AHNTVjidjZ0WK9r5bXxPVG05MY66JNQpiAmHmMT
         DjdWyieoqw4PCN9+YGGBwSot995LNvHWhFOnjCQH8n4wioO4iYBsnuwO9YjAQFxAjdE4
         8fGa7iznd0q9tFUiTfrP9mhtR2RC2XcUmX/xm1y+/r2B/QbvwGQHCPeUaQtbGbq1EEEl
         Nl/J7QZsM3WqvUlggYh9nTRskw7YPNcJJPgwejiQfFE2w9tTUA/aR2g13l9Wv6FisQ8+
         9q8g==
X-Forwarded-Encrypted: i=1; AJvYcCVF4BpjpdjT6M+Lvq5ukiU0kU5lbFpt2LO1pqT9+afuAjBeJUV4mKyAtaTcQH4VZWWmSt8T8gLbwR5TvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw/RkQvPAnj+XM17GrGO0wXtVSVMvVhFL6UAoof1yWuuMIZ9QL
	261P7Qo7cjoQlJ9KOQLoeA+9DHKSUajVEFt6MhrY6/vPS11HlptHMBJAECAciFKfCgYP28m/Dg9
	YusS9li3V7nnWi1pHUTy0x7ecr019CwQVDNgnbJbT0A==
X-Gm-Gg: AZuq6aL5I4eQEHfjdr5qxBjhCBw+b9xxHaZ/SfgGcbpw1ue1YhCnjLXVkLrhotxa1kq
	YY6rng21uwlMYCivicKdrqv8RyNtYI7g0mpROS17TMq1KP6lz7BX4T4Aaso23eHexUyohQI4jF6
	OOOXXcQ2Ajq0plybY/olzioN9RyNXWsRyvRy5jSDMpdU+iUingp+pwzbL/MyPh5AyPVxUcyuToL
	tNuS3qlOpWMTOQNe7gZIv/eW2j1UBnb9x5CdsfuDgAM5Zo4ao3WtuiebGwjYqi7AuE72KxwXHYJ
	I4GKamun2C8EZcqwlRK4O5cVCN3T76KS37QVztGUCQby5ule2rAwOXk0FQ==
X-Received: by 2002:a05:6820:180e:b0:662:f347:75ea with SMTP id
 006d021491bc7-66d0a380580mr2281379eaf.28.1770434483383; Fri, 06 Feb 2026
 19:21:23 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Feb 2026 08:51:12 +0530
X-Gm-Features: AZwV_Qgt6jGZeh_4zfnnbt8_F11u5jr2-fPeHJpG-DyOXqW_XCH4wBnJqmdFURc
Message-ID: <CAAhSdy3z70oEePkgOBziVOKgFGae-0xMD+8xmsMV2PWM1v0ToA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.20
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_192125_997888_CC2AED4A 
X-CRM114-Status: GOOD (  12.59  )
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

Hi Paolo,

We have the following KVM RISC-V changes for 6.20:
1) Fixes for issues discovered by KVM API fuzzing in
    AIA virtualization
2) Allow Zalasr, Zilsd and Zclsd extensions for Guest/VM
3) Add riscv vm satp modes in KVM selftests
4) Transparent huge support for G-stage
5) Adjust the number of available guest irq files based
    on MMIO register sizes

Please pull.

Also, please note that we have a conflict with kvm-x86
tree in tools/testing/selftests/kvm/lib/riscv/processor.c due
to patch "KVM: riscv: selftests: Add riscv vm satp modes"
discovered on linux-next. This can be resolved as follows:

diff --cc tools/testing/selftests/kvm/lib/riscv/processor.c
index 373cf4d1ed809,e6ec7c224fc3e..0000000000000
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@@ -64,15 -68,15 +64,15 @@@ static uint64_t pte_index(struct kvm_v

  void virt_arch_pgd_alloc(struct kvm_vm *vm)
  {
 -      size_t nr_pages = page_align(vm, ptrs_per_pte(vm) * 8) / vm->page_size;
 +      size_t nr_pages = vm_page_align(vm, ptrs_per_pte(vm) * 8) /
vm->page_size;

-       if (vm->pgd_created)
+       if (vm->mmu.pgd_created)
                return;

-       vm->pgd = vm_phy_pages_alloc(vm, nr_pages,
-                                    KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-                                    vm->memslots[MEM_REGION_PT]);
-       vm->pgd_created = true;
+       vm->mmu.pgd = vm_phy_pages_alloc(vm, nr_pages,
+                                        KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+                                        vm->memslots[MEM_REGION_PT]);
+       vm->mmu.pgd_created = true;
  }

  void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
@@@ -220,14 -212,8 +221,14 @@@ void riscv_vcpu_mmu_setup(struct kvm_vc
                TEST_FAIL("Unknown guest mode, mode: 0x%x", vm->mode);
        }

 +      max_satp_mode = vcpu_get_reg(vcpu, RISCV_CONFIG_REG(satp_mode));
 +
 +      if ((satp_mode >> SATP_MODE_SHIFT) > max_satp_mode)
 +              TEST_FAIL("Unable to set satp mode 0x%lx, max mode 0x%lx\n",
 +                        satp_mode >> SATP_MODE_SHIFT, max_satp_mode);
 +
-       satp = (vm->pgd >> PGTBL_PAGE_SIZE_SHIFT) & SATP_PPN;
+       satp = (vm->mmu.pgd >> PGTBL_PAGE_SIZE_SHIFT) & SATP_PPN;
 -      satp |= SATP_MODE_48;
 +      satp |= satp_mode;

        vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(satp), satp);
  }
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c
b/tools/testing/selftests/kvm/lib/kvm_util.c
index 265e173b73709..1959bf556e88e 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -359,17 +359,17 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
        case VM_MODE_P56V57_4K:
        case VM_MODE_P50V57_4K:
        case VM_MODE_P41V57_4K:
-               vm->pgtable_levels = 5;
+               vm->mmu.pgtable_levels = 5;
                break;
        case VM_MODE_P56V48_4K:
        case VM_MODE_P50V48_4K:
        case VM_MODE_P41V48_4K:
-               vm->pgtable_levels = 4;
+               vm->mmu.pgtable_levels = 4;
                break;
        case VM_MODE_P56V39_4K:
        case VM_MODE_P50V39_4K:
        case VM_MODE_P41V39_4K:
-               vm->pgtable_levels = 3;
+               vm->mmu.pgtable_levels = 3;
                break;
        default:
                TEST_FAIL("Unknown guest mode: 0x%x", vm->mode);

Regards,
Anup

The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:

  Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.20-1

for you to fetch changes up to 376e2f8cca2816c489a9196e65cc904d1a907fd2:

  irqchip/riscv-imsic: Adjust the number of available guest irq files
(2026-02-06 19:05:34 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.20

- Fixes for issues discovered by KVM API fuzzing in
  kvm_riscv_aia_imsic_has_attr(), kvm_riscv_aia_imsic_rw_attr(),
  and kvm_riscv_vcpu_aia_imsic_update()
- Allow Zalasr, Zilsd and Zclsd extensions for Guest/VM
- Add riscv vm satp modes in KVM selftests
- Transparent huge support for G-stage
- Adjust the number of available guest irq files based on
  MMIO register sizes in DeviceTree or ACPI

----------------------------------------------------------------
Jessica Liu (1):
      RISC-V: KVM: Transparent huge page support

Jiakai Xu (3):
      RISC-V: KVM: Fix null pointer dereference in
kvm_riscv_aia_imsic_has_attr()
      RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_rw_attr()
      RISC-V: KVM: Skip IMSIC update if vCPU IMSIC state is not initialized

Pincheng Wang (2):
      riscv: KVM: allow Zilsd and Zclsd extensions for Guest/VM
      KVM: riscv: selftests: add Zilsd and Zclsd extension to get-reg-list test

Qiang Ma (1):
      RISC-V: KVM: Remove unnecessary 'ret' assignment

Wu Fei (1):
      KVM: riscv: selftests: Add riscv vm satp modes

Xu Lu (3):
      RISC-V: KVM: Allow Zalasr extensions for Guest/VM
      RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test
      irqchip/riscv-imsic: Adjust the number of available guest irq files

 arch/riscv/include/uapi/asm/kvm.h                  |   3 +
 arch/riscv/kvm/aia.c                               |   2 +-
 arch/riscv/kvm/aia_imsic.c                         |  13 +-
 arch/riscv/kvm/mmu.c                               | 140 +++++++++++++++++++++
 arch/riscv/kvm/vcpu_onereg.c                       |   4 +
 arch/riscv/kvm/vcpu_pmu.c                          |   5 +-
 arch/riscv/mm/pgtable.c                            |   2 +
 drivers/irqchip/irq-riscv-imsic-state.c            |  12 +-
 include/linux/irqchip/riscv-imsic.h                |   3 +
 tools/testing/selftests/kvm/include/kvm_util.h     |  17 ++-
 .../selftests/kvm/include/riscv/processor.h        |   2 +
 tools/testing/selftests/kvm/lib/guest_modes.c      |  41 ++++--
 tools/testing/selftests/kvm/lib/kvm_util.c         |  33 +++++
 tools/testing/selftests/kvm/lib/riscv/processor.c  |  63 +++++++++-
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |  12 ++
 15 files changed, 330 insertions(+), 22 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
