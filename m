Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AABC606A31D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 22:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zuE7fM7S;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=JqRoJgdr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hBVPqgxB8AD5KdzL0ucKpz9Kd1JLOlmgLRsJ4UoEESM=; b=zuE7fM7SFsA12HimR9kgW2QTM7
	smA7PbVrFAzeyHYOn/HzKqpqDGGxFlSas91m/SsHvF5FCucv/DkIuEyICJEhVa+FifVOY5i8tCCbP
	iJOyi+LnB7/JYI4ToGYcVF5nNU8oF2HVuaYK1br7+DBwJ1wUZPjzbhXCjXTb/OhcLMYXe0FHjxrQD
	iPYBV5tEuRFM1JeLU/2HF+OQ7x8SlXZTEk5ANK2PX3zVEFiFP+BrNOiNyuCIjLK8UNEj6VBeidgil
	+QBd/+iQQaQYgau8RpQ5/DvFxLAsbVcME7fn90hcokfLb33/FGE1Zmp5/4hFV65KCWfQLx7+E35R9
	Id3whTVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMC8Y-000000081Mi-09R7;
	Wed, 28 Oct 2026 22:28:50 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMC8T-000000081M2-2CK9
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 22:28:48 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-35b2c599f43so3180535eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 15:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1793226523; x=1793831323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fhltQ3C2YstOxFJltFlEf35j9R/LHxLY9qVdwx4Wd0Q=;
        b=JqRoJgdrbwsUZrrD3BJ5O3lQhusEv7vpNhmlXOH2rkcwQF7HGWRUGZ7yGogEQYsm7U
         g33bPIts/FxzxIuVpHGiMuAQO4FfDWIJSLAojGO2Aq2aDP9KtvFRaODTTTXv6HY5hDjU
         4BaKn1Pv6DWzG8HQJwWeZ4dhaTuGDirwQ4QA5xO/q9PdHAXKSFE5TG4LTZIKSHSPAy1S
         MceLxtKkTHJjbXRDiI5kzektuVU03Dj8TtfLLvKgDpH5ylxpn+KsWBcJruE3vsiTNx+Y
         eK0kr5hduJkMOy5CWOxVPI1K42CdR8zlzvdO6IXh4/qbophdPutSMiWTGuwkHtG6Zh3l
         vIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793226523; x=1793831323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhltQ3C2YstOxFJltFlEf35j9R/LHxLY9qVdwx4Wd0Q=;
        b=LgkB1dEVoheTFNd1zpuqlAvLOh0YMmpjB43ZFOIIwVJS8ijlXw1QxGZLrfvOMxoAmX
         Gp9pczdqUwT3qfvDjuvh9Po+Qwody5lBtUJMdLWLQMumHjNadXK2Z+i4NK/2DX7U+hjZ
         fl8ISOzZx7cti6LICwvrs+RJ1NYoHhdqe4cmUrAk+DTziWixZE3DfFwK29InR1QH4Fb3
         lHNRDW5sOWk9p4QjznOPAutN1U7C+sJBhTL1x74E4Wm72U4pMoJxSKkOX227EaRScHBf
         uii/lCNpV8O8EgmQ9YD3qWONQLW0gRvzQVuHECrrrQvszaRHseHCZRMm1NJDn7IdunSG
         +vrw==
X-Forwarded-Encrypted: i=1; AKwUvBy6/XZlMxyodktisB3Iv/PdCJjCWguKluiPz/AoueIbgxsMVkh14/WCNEB6DoF+JhL1+YodwmyQRIR93w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKDRwhNqyvQgsY1Z4D+wrMRHx31vabqA9NFqcY6CjQWrqkHbOs0
	Mrzvn7qIC7uGOXMe6U/d5yk95ooEzT5gRIHln3t3rljUJnjnhErM05L7+2sERO91BP8=
X-Gm-Gg: AYBFou0YXRGk6SurLDMFWJX2AB8zqCgBawIiSc8BRfainIb9KtvMUgRT8zdJxcSKGqp
	jWPBjkob89TchCBhFh1RDcgoEwmAtf4MAVXQxnb/xT1NVetcYzayQkdfSQwrhT5gms4zXPpOoZy
	nI4n1+QRez7VSQ61vjzdRIhKz6lJDwgLWi1oD3Iz6P2aEC7ynXsXt/d43/LH151VTKuyMforWfl
	1vCSaWLLmzo6nLoxdrjdxecmtQ064/Yl7UXYK+Hbm9ha5AJ069QN7Gwlp8iUWdLEFIpk3pX+WDu
	UWfz02j9uLfCxPF/F3HVEsv83qg1O3+z95BgwZG8dWvCOE01+yN5Ol1dLUjPQ117ODeB4+BRvPu
	QQD2MU2wWbvcVltYvRwKOPiM2ZLlm8UnenmcRjWm7X8W4N6QhkFMdkqdVaNqoG7FYhIq+T/szpq
	JIbD+pyW97KqRRERGOU6O4d1NFQSXomtKICIYaK99lE03Nt/W+CBgCJJxmxugBj+3hfOkbJmDLJ
	WBEZ3yvYlaIGBEQsHmBs50UXkiwcWR/3/UWXwOl8EtF0X7qrt6ZnkI1YtFtlv1+WoeQ+YNUjvcx
	OPbFqHwvSdKEYmZofbSFvkT3W7puLcQALAeCXgSvgif3VAHOcNc/tKtO33mY5pXxI8T+h4KTcf0
	D3qKwCkta2us=
X-Received: by 2002:a05:7301:924:b0:36a:43d:8ef7 with SMTP id 5a478bee46e88-36a20434747mr5414183eec.18.1793226523312;
        Wed, 28 Oct 2026 15:28:43 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36a2390929asm12301773eec.12.2026.10.28.15.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:28:42 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: m.wilczynski@samsung.com,
	fustini@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	ukleinek@kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	elle@weathered-steel.dev,
	linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 0/1] rust: pwm: track the owner module when registering `Chip`
Date: Wed, 28 Oct 2026 22:28:39 +0000
Message-Id: <cover.1793150685.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_152845_615634_09912BF2 
X-CRM114-Status: GOOD (  17.35  )
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

Dear Linux kernel maintainers,

We are developing a tool called FerroLens to detect potential
unsound behavior in Rust code in the Linux kernel. The tool
internally uses an LLM to detect bugs.
We then perform manual analysis to verify these reports.
FerroLens reported the following bug in rust/kernel/pwm.rs:

`UnregisteredChip::register` calls the C function `__pwmchip_add` 
to register a PWM chip with the PWM core.
`__pwmchip_add` documents that its `owner` argument is supposed to 
be `THIS_MODULE`, but `UnregisteredChip::register` passes 
`core::ptr::null_mut()`. This is acceptable for built-in drivers.

However, for loadable drivers, registering the chip with a null owner
prevents the PWM core from taking a reference to the owner module when 
a PWM is requested or its character device is opened. 
This means that the owner module can be unloaded while references to the
chip remain. This can lead to use-after-free and
kernel panic.

Below is a PoC kernel module and associated python script that demonstrates
the issue.
The module can be unloaded while the PWM character-device file descriptor
is still open. When the file descriptor is closed, the final reference 
to the chip is dropped, which triggers the chip release callback from an 
already unloaded module. This leads to a kernel panic. 

    // SPDX-License-Identifier: GPL-2.0
    //! In-memory faux-device PWM provider for testing `UnregisteredChip::register`
    //! and the PWM character-device interface without physical PWM hardware.

    use kernel::{
        device,
        faux,
        prelude::*,
        pwm,
        sync::{new_mutex, Mutex},
    };

    const DEVICE_NAME: &CStr = c"pwmchip_add_poc";

    module! {
        type: PwmchipAddPoc,
        name: "pwmchip_add_poc",
        authors: ["Priya Govindasamy"],
        description: "In-memory PWM provider for pwmchip registration testing",
        license: "GPL",
        imports_ns: ["PWM"],
    }

    #[derive(Copy, Clone, Debug, Default)]
    struct PocWaveform {
        period_length_ns: u32,
        duty_length_ns: u32,
        duty_offset_ns: u32,
    }

    #[pin_data]
    struct PocOps {
        #[pin]
        waveform: Mutex<PocWaveform>,
    }

    impl pwm::PwmOps for PocOps {
        type WfHw = PocWaveform;

        fn round_waveform_tohw(
            _chip: &pwm::Chip<Self>,
            _pwm: &pwm::Device,
            wf: &pwm::Waveform,
        ) -> Result<pwm::RoundedWaveform<Self::WfHw>> {
            let period_length_ns = wf.period_length_ns.min(u64::from(u32::MAX)) as u32;
            let duty_length_ns = wf.duty_length_ns.min(u64::from(period_length_ns)) as u32;
            let duty_offset_ns = if period_length_ns == 0 {
                0
            } else {
                wf.duty_offset_ns
                    .min(u64::from(period_length_ns - 1)) as u32
            };

            Ok(pwm::RoundedWaveform {
                status: 0,
                hardware_waveform: PocWaveform {
                    period_length_ns,
                    duty_length_ns,
                    duty_offset_ns,
                },
            })
        }

        fn round_waveform_fromhw(
            _chip: &pwm::Chip<Self>,
            _pwm: &pwm::Device,
            wfhw: &Self::WfHw,
            wf: &mut pwm::Waveform,
        ) -> Result {
            *wf = pwm::Waveform {
                period_length_ns: u64::from(wfhw.period_length_ns),
                duty_length_ns: u64::from(wfhw.duty_length_ns),
                duty_offset_ns: u64::from(wfhw.duty_offset_ns),
            };

            Ok(())
        }

        fn read_waveform(
            chip: &pwm::Chip<Self>,
            _pwm: &pwm::Device,
            _parent_dev: &device::Device<device::Bound>,
        ) -> Result<Self::WfHw> {
            Ok(*chip.drvdata().waveform.lock())
        }

        fn write_waveform(
            chip: &pwm::Chip<Self>,
            _pwm: &pwm::Device,
            wfhw: &Self::WfHw,
            _parent_dev: &device::Device<device::Bound>,
        ) -> Result {
            *chip.drvdata().waveform.lock() = *wfhw;

            dev_info!(
                chip.device(),
                "stored waveform: period={} ns duty={} ns offset={} ns\n",
                wfhw.period_length_ns,
                wfhw.duty_length_ns,
                wfhw.duty_offset_ns
            );

            Ok(())
        }
    }

    struct PwmchipAddPoc {
        _fdev: faux::Registration,
    }

    impl kernel::Module for PwmchipAddPoc {
        fn init(_module: &'static ThisModule) -> Result<Self> {
            let fdev = faux::Registration::new(DEVICE_NAME, None)?;
            let dev = fdev.as_ref().as_ref();

            let chip = pwm::Chip::new(
                dev,
                1,
                try_pin_init!(PocOps {
                    waveform <- new_mutex!(PocWaveform::default()),
                }),
            )?;

            chip.register()?;

            dev_info!(dev, "one-channel in-memory PWM chip registered\n");
            dev_info!(
                dev,
                "current Rust register() passes NULL, not THIS_MODULE\n"
            );

            Ok(Self { _fdev: fdev })
        }
    }


python script - poc.py

  import os
  import sys
  import time

  # Check if effective user ID is root (0)
  if os.geteuid() != 0:
      print("Re-launching with sudo...")
      os.execvp("sudo", ["sudo", sys.executable] + sys.argv)

  fd = os.open("/dev/pwmchip0", os.O_RDWR)
  i = 0
  time.sleep(90)
  os.close(fd)


[24393.404056] Oops: int3: 0000 [#1] SMP KASAN PTI
[24393.404719] CPU: 8 UID: 0 PID: 11336 Comm: python3 Tainted: G           OE    N  7.3.0-rc5+ #80 PREEMPT(lazy)
[24393.405915] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE, [N]=TEST
[24393.406755] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
[24393.407714] RIP: 0010:0xffffffffa05ba121
[24393.408166] Code: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc <cc> cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc
[24393.410391] RSP: 0018:ffff8882f033faf0 EFLAGS: 00000282
[24393.410988] RAX: 1ffff110241bc49d RBX: ffff88834e7a6800 RCX: 8000000000000001
[24393.411748] RDX: ffffffff84ccc660 RSI: ffffffff84b33dc0 RDI: ffff888120de2000
[24393.412490] RBP: ffff8882f033fb20 R08: ffff888120de203b R09: 1ffff110241bc407
[24393.413231] R10: dffffc0000000000 R11: ffffffffa05ba120 R12: dffffc0000000000
[24393.414162] R13: dffffc0000000000 R14: ffff888120de2000 R15: ffff888120de24e8
[24393.414952] FS:  00007f16044f2000(0000) GS:ffff888425dc4000(0000) knlGS:0000000000000000
[24393.415777] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[24393.416376] CR2: 000022f4a14aa000 CR3: 00000003430b6001 CR4: 0000000000372ef0
[24393.417115] Call Trace:
[24393.417385]  <TASK>
[24393.417677]  ? device_release+0xc0/0x1c0
[24393.418290]  kobject_put+0x1e1/0x410
[24393.418739]  cdev_default_release+0x192/0x1b0
[24393.419250]  kobject_put+0x1e1/0x410
[24393.419649]  cdev_put+0x45/0x60
[24393.419996]  __fput+0x612/0x7a0
[24393.420343]  fput_close_sync+0x9a/0x130
[24393.420755]  __x64_sys_close+0x84/0xc0
[24393.421171]  x64_sys_call+0x815/0x2600
[24393.421644]  do_syscall_64+0x11c/0x3f0
[24393.422144]  ? debug_smp_processor_id+0x1b/0x30
[24393.422662]  ? rcu_is_watching+0x1a/0xc0
[24393.423108]  ? debug_smp_processor_id+0x1b/0x30
[24393.423594]  ? debug_smp_processor_id+0x1b/0x30
[24393.424086]  ? rcu_is_watching+0x1a/0xc0
[24393.424505]  ? trace_irq_disable+0x3c/0x130
[24393.424978]  ? do_syscall_64+0x6d/0x3f0
[24393.425390]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[24393.426080]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[24393.426879] RIP: 0033:0x7f16043150b7
[24393.427488] Code: ff e8 4d 15 02 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 41 c3 48 83 ec 18 89 7c 24 0c e8 e3 b8 f7 ff
[24393.429713] RSP: 002b:00007fff2611a4f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
[24393.430658] RAX: ffffffffffffffda RBX: 000056304d48d870 RCX: 00007f16043150b7
[24393.431387] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
[24393.432112] RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
[24393.432841] R10: 000056304d48d870 R11: 0000000000000246 R12: 000056304d48d870
[24393.433628] R13: 0000000000000000 R14: 00007f1604129db8 R15: 000056303ab55300
[24393.434532]  </TASK>
[24393.434783] Modules linked in: binfmt_misc intel_rapl_msr intel_rapl_common kvm_intel kvm rapl joydev i2c_piix4 e1000 i2c_smbus floppy qemu_fw_cfg sch_fq_codel dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua msr efi_pstore autofs4 raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor xor async_tx raid6_pq raid1 raid0 aesni_intel gf128mul input_leds psmouse mac_hid serio_raw pata_acpi [last unloaded: pwmchip_add_poc(OE)]
[24393.438940] ---[ end trace 0000000000000000 ]---
[24393.439415] RIP: 0010:0xffffffffa05ba121
[24393.439420] Code: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc <cc> cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc
[24393.439422] RSP: 0018:ffff8882f033faf0 EFLAGS: 00000282
[24393.439425] RAX: 1ffff110241bc49d RBX: ffff88834e7a6800 RCX: 8000000000000001
[24393.439427] RDX: ffffffff84ccc660 RSI: ffffffff84b33dc0 RDI: ffff888120de2000
[24393.439429] RBP: ffff8882f033fb20 R08: ffff888120de203b R09: 1ffff110241bc407
[24393.439431] R10: dffffc0000000000 R11: ffffffffa05ba120 R12: dffffc0000000000
[24393.439433] R13: dffffc0000000000 R14: ffff888120de2000 R15: ffff888120de24e8
[24393.439435] FS:  00007f16044f2000(0000) GS:ffff888425dc4000(0000) knlGS:0000000000000000
[24393.439438] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[24393.439439] CR2: 000022f4a14aa000 CR3: 00000003430b6001 CR4: 0000000000372ef0
[24393.439445] Kernel panic - not syncing: Fatal exception in interrupt
[24393.449336] Kernel Offset: disabled
[24393.449769] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

Priya Bala Govindasamy (1):
  rust: pwm: track the owner module when registering `Chip`

 drivers/pwm/pwm_th1520.rs |  1 +
 rust/kernel/pwm.rs        | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
