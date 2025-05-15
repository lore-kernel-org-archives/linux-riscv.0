Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2553FC3DA6D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aRhn4ZfmyNcqRjO4LzTd55j4v+hCQy2hc6N9Jm4Da1U=; b=EpEohmN8dU+inS
	skCpW3yRAfaRShey8YAluvTLaJrJ35olcH1QT8OCpiSqojZj02nT8//cgcOgRTfmZE6WX9ZgWWlhh
	VKkepYLUGt/nGxkkFEUwirHtTXhpkZ1dlCYY33tXoi2AN97H/ClDGUMmiL0Yc22rpv8XPAm/frOvx
	XJdjBrT1iUbuA3l4anoXbX7KQu29MZIESv5NpwJK75Mdi8d8uf00QbGQsuWisF1a4uQzTJflUU9de
	0MQ15UOkjh9TIwQ2AZveU+CPWR9wtTxuPqFiaGtXXtnFGj+MKZiPqwDM62u1Zp9IcWxt7AYdLeAGG
	zDN5v+jd4cJ4q6IAX6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa3w-00000000yKR-0rQQ;
	Thu, 15 May 2025 14:59:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZxA-00000000wvB-27wf
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 14:52:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-442e9c7cf0eso673475e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747320774; x=1747925574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JBNMBVMfrCwOqVA/j6iAZ2xlfGUT5Oj6Dz/mC6Rjl5s=;
        b=UDnRGQciiYsYnPKeoOhBiXsqQCPmmAtl2jR2eHFYSHKQoerzydagTcj/2rd+qkpnj1
         FTpMNzerObG5GU5YBKwVIuUNGpL3iLyhKpzsfO5mL0mnB4Z66QiCroakod/1kEj2assc
         8UmRRn2t+Q5D2z64UE+SLYyQCB75QnrhUKTbVQ6/vZQ/RqVozvEgeqojaxcHo5zu8XgM
         cK0FS69nrhennBEgY7k0Pa4LLsap+LywQazbzn83lhdbdtZBRq3AVvGrPpicfOrteOMX
         d8oR0vlRy5Qsp0jyn+l3o39ghm/muTh40yly3VBPP1J8ZDzqZVTQ/QgAjZZcJC08gyqV
         Q7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320774; x=1747925574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBNMBVMfrCwOqVA/j6iAZ2xlfGUT5Oj6Dz/mC6Rjl5s=;
        b=C8vin6pMjUhYwJTBjL/qRiJcPxk0J9aFLVBIDR9GAtABAuqeZJRMIDQ2jslqsPx3H7
         DjmJMu3KFYVKpLsvPbgDxmbWuAuqSGlI9h2Lez89voDU40oxDbeN0Ahrmg1n27h9MS2M
         wRp0wBBhbdtpHpmISc55GSX53hbGxviH4zBIQEqxp5ICp5rroiyIWhUE9tv/jSttlpz4
         xjqZO2LdNjsqPdJ4zS87THeQt5/62r8H69slB5tSDk9akqXhm3As78S2mh4D/s4z5apK
         lERWmAEqyBNy73TYHxVp9E5nwD83noq+g0Rd6r3my6a4HJ/9EQq2PMfFCcVbvCaVTt5m
         d68w==
X-Forwarded-Encrypted: i=1; AJvYcCXjWU1EYQstwN2RyAGg94LVqL4S/U911VCHxbH/xNqv+mJkJM9Qzk6WwrBz/RG41vSWP+e5IZoeA0M1Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YynUzhFcqpWO5weTl+/SD5Ni7GMpxyrQ4o16xg2LBZ+fEf2HsYt
	JpyE2+x8nJq9YUbv6V7bCpZQJaYoPcCxqMCMxgqZ8G4c4Efhx1pM60xQDuOt0aU=
X-Gm-Gg: ASbGncuIJLVwXviNWAqEON6to045WGpBqQ+aFs4HumykdW6VytQmjyaKVAb3H/8hJNd
	leQUTfiuVyRHVmetgNi3fw4MNqnHktdIXNQbiBPOpKUaQXnTWU5StSG8pZ7oIlJwlGU+ZodLmmb
	OU6POiCGSB68rl4UCo59Xf4Glq/3DIjn88yhqKuW8zn0UIUQLmx8RBQHnyLw4qmnP/yC0bjOxhm
	XSEWB/qUte+83X0Asg7w7eVgpYo8sFTz5e6Qq6q9I0Km7HZkUjI+cmx7EdwuKK5a/KK1iJhmd6J
	mz1yRr748682Fn2/odH7ymmFA+MjxVLkc0tEKRm4JFXDeLPT8h6OOJje
X-Google-Smtp-Source: AGHT+IEjWdfaSstCa6WtRNHMXeY5NKPx+dlpO0u8cbQ+/wmwqBYSpQzl4SUc23EpyvhrjvwJhEHmXw==
X-Received: by 2002:a05:600c:1384:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-442f1ddcf8emr28595905e9.0.1747320773678;
        Thu, 15 May 2025 07:52:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:59f5:9ec:79d9:ffc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951a97sm75040025e9.23.2025.05.15.07.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:52:53 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
Date: Thu, 15 May 2025 16:37:24 +0200
Message-ID: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_075256_547487_823B3AEE 
X-CRM114-Status: UNSURE (   7.71  )
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

SGVsbG8sCgp0aGUgZGVzaWduIHN0aWxsIHJlcXVpcmVzIGEgZGlzY3Vzc2lvbi4KClt2MyAxLzJd
IHJlbW92ZXMgbW9zdCBvZiB0aGUgYWRkaXRpb25hbCBjaGFuZ2VzIHRoYXQgdGhlIEtWTSBjYXBh
YmlsaXR5CndhcyBkb2luZyBpbiB2Mi4gIFt2MyAyLzJdIGlzIG5ldyBhbmQgcHJldmlld3MgYSBn
ZW5lcmFsIHNvbHV0aW9uIHRvIHRoZQpsYWNrIG9mIHVzZXJzcGFjZSBjb250cm9sIG92ZXIgS1ZN
IFNCSS4KCkEgcG9zc2libGUgUUVNVSBpbXBsZW1lbnRhdGlvbiBmb3IgYm90aCBjYXBhYmlsaXRp
ZXMgY2FuIGJlIHNlZW4gaW4KaHR0cHM6Ly9naXRodWIuY29tL3JhZGlta3JjbWFyL3FlbXUvdHJl
ZS9yZXNldF9maXhlc192MwpUaGUgbmV4dCBzdGVwIHdvdWxkIGJlIHRvIGZvcndhcmQgdGhlIEhT
TSBlY2FsbHMgdG8gUUVNVS4KCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0tcmlzY3Yv
MjAyNTA1MDgxNDI4NDIuMTQ5NjA5OS0yLXJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbS8KdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS1yaXNjdi8yMDI1MDQwMzExMjUyMi4xNTY2NjI5LTMt
cmtyY21hckB2ZW50YW5hbWljcm8uY29tLwoKUmFkaW0gS3LEjW3DocWZICgyKToKICBSSVNDLVY6
IEtWTTogYWRkIEtWTV9DQVBfUklTQ1ZfTVBfU1RBVEVfUkVTRVQKICBSSVNDLVY6IEtWTTogYWRk
IEtWTV9DQVBfUklTQ1ZfVVNFUlNQQUNFX1NCSQoKIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBp
LnJzdCAgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV9ob3N0LmggICAgIHwgIDYgKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV92Y3B1X3NiaS5oIHwgIDEgKwogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
ICAgICB8IDI3ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmkuYyAgICAgICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKystLQogYXJj
aC9yaXNjdi9rdm0vdm0uYyAgICAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysr
KwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bS5oICAgICAgICAgICAgICB8ICAyICsrCiA3IGZpbGVz
IGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKLS0gCjIuNDkuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
