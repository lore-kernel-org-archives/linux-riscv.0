Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD1CC021A2
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMOrut6R4TAN79yO8IxtUtFdOzZL3mTEbv1n5iblEg8=; b=YbBAZJd6pstmb5
	2gGSP6VJCJVY3zhmt6Upvo1SmejSR2BzhXFZ5IxJYKwBp0H1gPf0s9ynsyvqpxS8Wf8uWCJ0jlwBp
	QDJvpKddlkTEvbjoHA2oHpnVQ8NHOvC+4VWy5tCiDBNmPU6CVJdknW18IXPWqdJzbqcE69Nhh1T/v
	77j59lP0nJWVb419H4MJ1lfn4oVlEK9WOPNQuC7RW6v9XvlzpUrdy8XigVZ494TBo0AfOpzv3Zyyl
	hsCsbI7jU/hZO6pUjEOUZWLQ2l1e6FPEihDOXtZkcXXX/+1rUW0/fFq7AARITM4eXE6oOxsCgoSpB
	P0w0NREpT3ytYT6tlaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbWN-00000001WmB-0lKG;
	Mon, 10 Feb 2025 21:40:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNU-00000001KaE-0few
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=a5uI84SXblQRDID2BHNWhhHsRc7xVUDdoiei4kS9c/0=; b=CvXL9fdfuJjjiIYjYoWFS2ZL84
	HHfl43TiJ48MYcj2iqNPPFSwyebQrmg/obgkDXreHUBcmV9o3AJrk1+hxEvv6j+bAeiECeNzDZqGp
	f+17ZNxFqKdhJ4nJMDD+mk1Rh9DnrapDo1Ff5D5t9sGkRZwrjZRW4BA32OJ9N+4LViXypRBrPTaaX
	Sqquh83bkAaAzk4M2sz6Ru6MSnZqC7gTrLnu0dbvxyEkDqsXf2skTod4J5RhpUl21qxek6fNkBYq0
	37Zuxrh4TfR52/Sz/dJJEqgoNWC31p0TbGXF5Ctpppyef93eU17Vp1rn0Kc3ETA/T+d4l1bEXc/XC
	KfpYNs1g==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNR-00000000Dnf-1Z26
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f48ebaadfso79070705ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219252; x=1739824052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5uI84SXblQRDID2BHNWhhHsRc7xVUDdoiei4kS9c/0=;
        b=ufnd/ccd7FJUXgTuwS94eD9ALcRWU2GVnfswn3jVydKsLeqUpco+fIXojIH8gSnj9S
         I60n2jaimEZZ7ReFtC1o1U568BBeWrziRYYJBd2mwOQ6thHExqO7K+xZMqoyH80OOCMQ
         HaiIj43AyvMB7GL0fQwE3s5xID+OW6Z4P4t7/kNXbdHOjBqfoMtg2etJgTu46OvM0h8C
         QTB9On9o8vv0+ot8kNgt2EQcznmVYFzSwmvNRJUg1smfZhQd7vcTMBevFuoO9DmBBo+Y
         9z5nusvs/Hd4n4Ay2pnA2IO6NSzW0il7XN8CgPbPgA/ytdqmfpXaeDKJN7GXZFWdDvA7
         x7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219252; x=1739824052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5uI84SXblQRDID2BHNWhhHsRc7xVUDdoiei4kS9c/0=;
        b=Fdr+hyByG4N1q/ZJ6zpVtFIG8xVGj4DAZKCufkNSvuJx2BAKq9f1w4RIEPG77Q42A+
         AI1kLipYxIGPZ7MKXAueT2cBPJqYFhawpFr1DglrH4R+VM0YDXXSOvoWg+j1pFvKIHTW
         h6sN0qigjW0NFnOSeR28aVrU5YPM7NDb/YO/WiticfFGIV17zENRA+uraH0cPYQKvyTM
         CyGTw2U/OIEotTw/F+YMA5M1HJNQUQNKCU/b9D+/BDrsKEOJo2utQV3bZ3tK/IB5Kbz2
         vhdxiOzkBWtzJLBaR/7ULW8qMlWBRBQM5qJHuMFnw+U3Ym+YxibKarn2raVZGnsGlZfM
         zmOg==
X-Forwarded-Encrypted: i=1; AJvYcCUqC4sFrwy3Vg26obekC+/qgcvkW2WAKwGtd8ObuGDW6rWczrvznBboCw32ZQDhR8vlKJEAoMVvVEyeSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzLx5WVqQNPk6YhE8LT3Sutm4+0oghiemr+eDojEDy8FqpipQv
	BV3SvZixU+FAaOGfhc8ULl9meXhsT+6xlPIzzRgdYtD+iQCUyPBqRgOuo4pENCw=
X-Gm-Gg: ASbGnctaORxIc6cEllWD0XQOnuaKe0EbRhWXagi+QdciZNfSPXOQPWR7zJGq7RfApz7
	ZuFwKj3sOvF7BrOUy0eWBu1R5J9LTOVpU/46zfCPMWWx4qIGeBRd74IwSGZO6CqRjd3CLSzuam0
	o+qJqnD2D9pqTMUjs3tR/LlseYxZFs1TiywMO1FlpACVX6dpgA6gbYYlmbcWFdq18uwThjSYJgN
	3NDBaTJB9D1+DZHjKnoBbGrhu7ozFu0rQgyNz/16qsR7BHhUanI+apCYurc/BzSa/66DTCRtnAA
	aSutj6DGhbDEDpVUbogRAHrQoQ==
X-Google-Smtp-Source: AGHT+IGRSFFgWaceOiIiNm5tv+e7IogqAyyOZF4Jzr3uh0XSSHp0Pwy9ipwzTE00hP4VjDiSKq3vug==
X-Received: by 2002:a17:903:32c7:b0:216:39fa:5cb4 with SMTP id d9443c01a7336-21f4e6ce13bmr265561195ad.25.1739219251992;
        Mon, 10 Feb 2025 12:27:31 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:31 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:53 -0800
Subject: [PATCH v10 20/27] riscv: Add Firmware Feature SBI extensions
 definitions
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-20-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_202733_535293_38173B2C 
X-CRM114-Status: UNSURE (   9.85  )
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

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKQWRkIG5lY2Vzc2Fy
eSBTQkkgZGVmaW5pdGlvbnMgdG8gdXNlIHRoZSBGV0ZUIGV4dGVuc2lvbi4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKaW5kZXggM2QyNTA4
MjQxNzhiLi4yM2JmYjI1NGUzZjQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaApAQCAtMzUsNiArMzUsNyBA
QCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9FWFRfREJDTiA9IDB4NDQ0MjQzNEUsCiAJU0JJX0VY
VF9TVEEgPSAweDUzNTQ0MSwKIAlTQklfRVhUX05BQ0wgPSAweDRFNDE0MzRDLAorCVNCSV9FWFRf
RldGVCA9IDB4NDY1NzQ2NTQsCiAKIAkvKiBFeHBlcmltZW50YWxzIGV4dGVuc2lvbnMgbXVzdCBs
aWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFSVCA9IDB4
MDgwMDAwMDAsCkBAIC00MDEsNiArNDAyLDMxIEBAIGVudW0gc2JpX2V4dF9uYWNsX2ZlYXR1cmUg
ewogCiAjZGVmaW5lIFNCSV9OQUNMX1NITUVNX1NSRVRfWChfX2kpCQkoKF9fcmlzY3ZfeGxlbiAv
IDgpICogKF9faSkpCiAjZGVmaW5lIFNCSV9OQUNMX1NITUVNX1NSRVRfWF9MQVNUCQkzMQorLyog
U0JJIGZ1bmN0aW9uIElEcyBmb3IgRlcgZmVhdHVyZSBleHRlbnNpb24gKi8KKyNkZWZpbmUgU0JJ
X0VYVF9GV0ZUX1NFVAkJMHgwCisjZGVmaW5lIFNCSV9FWFRfRldGVF9HRVQJCTB4MQorCitlbnVt
IHNiaV9md2Z0X2ZlYXR1cmVfdCB7CisJU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcJCT0g
MHgwLAorCVNCSV9GV0ZUX0xBTkRJTkdfUEFECQkJPSAweDEsCisJU0JJX0ZXRlRfU0hBRE9XX1NU
QUNLCQkJPSAweDIsCisJU0JJX0ZXRlRfRE9VQkxFX1RSQVAJCQk9IDB4MywKKwlTQklfRldGVF9Q
VEVfQURfSFdfVVBEQVRJTkcJCT0gMHg0LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX1NUQVJU
CQk9IDB4NSwKKwlTQklfRldGVF9MT0NBTF9SRVNFUlZFRF9FTkQJCT0gMHgzZmZmZmZmZiwKKwlT
QklfRldGVF9MT0NBTF9QTEFURk9STV9TVEFSVAkJPSAweDQwMDAwMDAwLAorCVNCSV9GV0ZUX0xP
Q0FMX1BMQVRGT1JNX0VORAkJPSAweDdmZmZmZmZmLAorCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VS
VkVEX1NUQVJUCQk9IDB4ODAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX0VORAkJ
PSAweGJmZmZmZmZmLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVAkJPSAweGMwMDAw
MDAwLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9FTkQJCT0gMHhmZmZmZmZmZiwKK307CisK
KyNkZWZpbmUgU0JJX0ZXRlRfR0xPQkFMX0ZFQVRVUkVfQklUCQkoMSA8PCAzMSkKKyNkZWZpbmUg
U0JJX0ZXRlRfUExBVEZPUk1fRkVBVFVSRV9CSVQJCSgxIDw8IDMwKQorCisjZGVmaW5lIFNCSV9G
V0ZUX1NFVF9GTEFHX0xPQ0sJCQkoMSA8PCAwKQogCiAvKiBTQkkgc3BlYyB2ZXJzaW9uIGZpZWxk
cyAqLwogI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCgotLSAKMi4zNC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
