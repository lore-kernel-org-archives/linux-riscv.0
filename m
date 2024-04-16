Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77841C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Igg1/Pz7JxXB91N497A7jEBzgo+fMuk3Dv0eKGyfAEY=; b=UlzXSrekEg3/co
	B6f0BIZ74zKNTGmEf/k/SK6crY29+PpfT0cG2px+agVhbtK9v9Fyg/ruGSsWsPx/n1mddYGcyK4dP
	72lJ18KMj9NyBXJj33mA8NBzI77/ONSWS3lgu5iawzx5PQWXEmoA9y9AqAVRY2Y9ULbpIxs5MjLGk
	QCSouTnIQ56xKz8QXmKAzfVEB/2X67xJeMo4MF1QbNUUty1DUSyoEIrL9hxyXe5arWCMdylqnI5yi
	MkKci5Tj8A0oaPjN91K3BCAHaY/m77M1CgcV9D0OM5x7zfrcOyByFTG37snK+FTw0Uw6utbxhAmC+
	H7tWPS82MuD4dUPp16Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnd-0000000DMKl-1mGP;
	Tue, 16 Apr 2024 18:44:57 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnR-0000000DMCf-1Oee
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:44:51 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2a6fa7773d3so3314796a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293084; x=1713897884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nwzSC0mjOXawHhzlfTnID2LKW7HdSbdpZLlPlBet3o=;
        b=y7IUy79yX72El6c72XIPjdrryrarmqcoSP9AQGRq3Tw4f1f/Uv1DVxEslUcL0aUQHr
         TFcJVZNT0Ap7NTm9Yvj33cdFNhshLtSxaKnk512VYmjdte4xZbR9/3Tf4n0SHDj/+jMj
         or6aWWlzt8k4vHo8uVyyTUbqVkK6cvSIj4X1WREVoK0ynomYKFrsT7RXFSfB9yZCNWM9
         QUWH8XbCO5TjBKuCzv9B1UeM0Pc3ZaXrROVQTPTO8SvpwBgA33CvX7GbfB0exvJsODG+
         kGOQaD20kfCrSh0cbsxJaBAW6OTm5zdRBpKmImWcbXyOblFC2nKrCHR30HmTP72k49pI
         72oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293084; x=1713897884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nwzSC0mjOXawHhzlfTnID2LKW7HdSbdpZLlPlBet3o=;
        b=YOuLlknYl0WvRU556AtOFkpum3aMrKlQhuzKIOlG6GyzgCax4Ta/Un8dLTqVoCyW3F
         IM3Pvi/jZ4+aF6H+znHLu/WVUDlMHgAGORm1O5oZ79a7UthRnoK4CRGRY5K1iIU8qega
         hTBrRq5ALM0tz6g2jNy27s9xT342ggOnQtNwTSlQXu7v/aRhneQhmcmsyDoVhDiDkb1Z
         KMJpopJMeywup3AB7eYQqQimXNW5t3wO+5FUwCrtduF62+dWdk5VPBsPKw7loorRlAMj
         vfBxNJVa5boKanhzdM/lPmHaTHFZ1Jxvl9tUHgQZ4B2VIUda7VTCYRrh+kXhkbuoik30
         aYyA==
X-Forwarded-Encrypted: i=1; AJvYcCVUJ///ADPXTLrH1o+ORFMevRKU8+KyGdXesGXo7fBuZnaB8w3dJW+aS4i0MHl++m1f0xVygPjUfG7vVM+jmCOla+X/jPFOFo39jTqu7cmh
X-Gm-Message-State: AOJu0YxhCPMSpj4Ax43CeZd+Th5y14Rph/BK7OT2j1Ei+BUq4RG8+rUD
	wWORq6FKBugTfnFBD77DwpNarxHMgMOa2QInoVq7MYhJb1ZZugtSf99ZYfA6hro=
X-Google-Smtp-Source: AGHT+IEoEjUu4cy1AorDUlJRRsn2LFZCsazPsjOtul090pjdnU5WLR3vSTyvWTwboMGTmVgvzKEuGA==
X-Received: by 2002:a17:90a:b00d:b0:2a7:8794:bd9d with SMTP id x13-20020a17090ab00d00b002a78794bd9dmr7689700pjq.39.1713293084173;
        Tue, 16 Apr 2024 11:44:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:43 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
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
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v7 02/24] RISC-V: Add FIRMWARE_READ_HI definition
Date: Tue, 16 Apr 2024 11:43:59 -0700
Message-Id: <20240416184421.3693802-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_114445_440874_92F61339 
X-CRM114-Status: UNSURE (   9.12  )
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
QW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KUmV2aWV3ZWQtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgpTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9z
aW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAppbmRleCA2ZTY4ZjhkZmY3
NmIuLmVmODMxMWRhZmI5MSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmku
aAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCkBAIC0xMzEsNiArMTMxLDcgQEAg
ZW51bSBzYmlfZXh0X3BtdV9maWQgewogCVNCSV9FWFRfUE1VX0NPVU5URVJfU1RBUlQsCiAJU0JJ
X0VYVF9QTVVfQ09VTlRFUl9TVE9QLAogCVNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRCwKKwlT
QklfRVhUX1BNVV9DT1VOVEVSX0ZXX1JFQURfSEksCiB9OwogCiB1bmlvbiBzYmlfcG11X2N0cl9p
bmZvIHsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
