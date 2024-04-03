Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E100BCD1296
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1aWHjY3Uo1f+X0HovoUjtD35ls9m8alH1ewJ3R0xr8=; b=Wl9bnoOCLKJmp+
	PmQ23H9tmcwZNAuj/voGtUjyxT4PVZ5g2bk/9ZCslTe886n7MY+aUqJK0zZoXrWuoFqyJgz8Bq0R1
	zYVk0rh7I5F3b+lsjIMCNnF/ncSYKzAcQXerOuTcR/pgWfpSB0W/juNLi4iUez7qKZ2X5XWXLqgOT
	7zYHUXbj5+qD81rd2sq/ZQ2fdwOYhN68jbna10UnXQYa7yy0J5ZbWERvuXf5A8+EMQh2dBeis7O/B
	sPpQoQmb7cbu4A1XWMaDC4DW10OpcLAn5jvk3OeoJYDqUEgMy+LdGmjxxLw2bi6F07PSr8oVopxah
	L0HPWKOKQgeMyZSFKoGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrwlu-0000000FACX-3F7O;
	Wed, 03 Apr 2024 09:19:06 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcb-0000000EiUz-3aLh
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:27 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e28856ed7aso8286705ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131516; x=1712736316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bc4Qbmx0AoxDu4ditj7xvL7MfGG2VDboL8zvDiTC/bw=;
        b=OXNwQ7LlRmAl8/ESr5lNv+nu2EJcZwnIZUKFY/Xkie6SYvTwdr3j/wfg9bLh19L4rP
         OmEFqyBHF46df0qRq2dcsUVO/8oleeZFxplWDxWfwpPpzZsozHvXonTooSgu5nG7hszE
         ES57Afyqh8tcaaV4CkRjsh05mUqm9L74/fUDmbqHGVIRrUgNysgZFLQGQzOeGyTR/yot
         j+PHfcaUmeZA9IW9gsoBwJzNyEg5kF6KlDx8viua2juIzXQwXBI4OVNqdfjiUx+eLee/
         FVVKh7tMDMcKCx9qWxguUEYThTl8jqL5B2DUEPCZiF5EODPG8oubiI4uDr8eX2pwJjxZ
         o3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131516; x=1712736316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bc4Qbmx0AoxDu4ditj7xvL7MfGG2VDboL8zvDiTC/bw=;
        b=pzBiyxbF22a4FtVz9blbnQ0VGuJwOWcEZrQsTh7dIQVvgqjcyzY5DGIrOXDkQILhd6
         WHEnOxvY7BH7E4UZVDEgvv3doB+SqfL+XKQ6wWJF9DN8ojBLkSCp6/EL35DodGpU2Dr9
         8GrOM8foStamCL9wq1p+2LUsxl9mW/mER7sMhnBZIfdD92DU3XidUGecoqHcYceHLSAo
         13oL5J1Q/boVtyDSE3l9IBvSo1fXFyr7kaDgcv1wwUaT7V0E2kFiClE0dZs56DxvxZZ0
         lkuCtvmhb5OLSRyhIT0I7ZaygtsR4DvvhwuTcAWt5qRyi8sOTGcsvfbqCYQkRB7OsVEr
         fx2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/TSEACQ5JhXjkl3o5DNYmbvAn8F+GKDxuHq+WYqpoT3ZiiVDhWOy+Rj4kllSoJlEFR3NPVtkvRinpclZQMQuYxad4hqreI9UYif1uoi5Z
X-Gm-Message-State: AOJu0YxzgdmDCwNwqtPvCel4wPmHwf7ONttKPwlBRAAIqAAKInw9QmTl
	m+MPSFtqdo6vquAtbyNlux9h85WrGooUnmOnoctxkFhp2wSFahdmaAGFHHcabfc=
X-Google-Smtp-Source: AGHT+IEN9FTCaj0hRotpYu2L3MLNBsnLZyWzCk4MgIL/9u1tPeTTuGgG3qQXqUKuRiVdVxo5cBEIJA==
X-Received: by 2002:a17:902:b089:b0:1dd:878d:9dca with SMTP id p9-20020a170902b08900b001dd878d9dcamr1981385plr.48.1712131516075;
        Wed, 03 Apr 2024 01:05:16 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 02/22] RISC-V: Add FIRMWARE_READ_HI definition
Date: Wed,  3 Apr 2024 01:04:31 -0700
Message-Id: <20240403080452.1007601-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_010525_987326_FA0A05C2 
X-CRM114-Status: UNSURE (   9.23  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U0JJIHYyLjAgYWRkZWQgYW5vdGhlciBmdW5jdGlvbiB0byBTQkkgUE1VIGV4dGVuc2lvbiB0byBy
ZWFkCnRoZSB1cHBlciBiaXRzIG9mIGEgY291bnRlciB3aXRoIHdpZHRoIGxhcmdlciB0aGFuIFhM
RU4uCgpBZGQgdGhlIGRlZmluaXRpb24gZm9yIHRoYXQgZnVuY3Rpb24uCgpSZXZpZXdlZC1ieTog
Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwg
PGFudXBAYnJhaW5mYXVsdC5vcmc+ClNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBA
cml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IDZlNjhm
OGRmZjc2Yi4uZWY4MzExZGFmYjkxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKQEAgLTEzMSw2ICsxMzEs
NyBAQCBlbnVtIHNiaV9leHRfcG11X2ZpZCB7CiAJU0JJX0VYVF9QTVVfQ09VTlRFUl9TVEFSVCwK
IAlTQklfRVhUX1BNVV9DT1VOVEVSX1NUT1AsCiAJU0JJX0VYVF9QTVVfQ09VTlRFUl9GV19SRUFE
LAorCVNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRF9ISSwKIH07CiAKIHVuaW9uIHNiaV9wbXVf
Y3RyX2luZm8gewotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
