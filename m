Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9927D3ABEF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 03:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCfhweCPJ4rKODbnXAqmUPGSRyOTCruva0bqG5NJ4g4=; b=CVIouJ0pPtULuc
	RvbhkSjiyMnDZqAQzTFw/fnAdVhh/ymq0aZJ2bspEuaB55Lzpy6lszB4nY66HaJrpJEjuEboP3DaJ
	zqRMdh/szUFfuDe4Zt/fixNqoAMId/u7Ufc8ZwdWz92e6efGIaS117992s78Kt7VUhPNrr+DLex9v
	D3Y91SvXoMPeb8Ya2i0TcVufKy5RePtttKT4/BDAC4UT8oNO4M6+vopKPJV6fvqJdpuB6eDl8Dqzo
	ZF1pJFhVpZ44q9II3zRi7mJQVYPEd1cf06G+JtPUGKslto2YHuiZCwHKlqlp9WFTYLwVqfA9LhjCf
	VKBgt8ETCFslnnqrjDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSSH1-0000000CXui-0LUL;
	Mon, 08 Dec 2025 03:50:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSSGz-0000000CXu1-1i3F
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 03:50:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-298287a26c3so52937375ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 07 Dec 2025 19:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765165852; x=1765770652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFr5RgkhvM6EE5Q/RHn3oG8Xllt/H7Gtrl4Nvhbq1ik=;
        b=QSTlK9KneCDgG+ZS84uxkECddlrO1nzKFSGYORM3dI8WSrLRBVz0N8ePSCQo6t8hWE
         gm3APvd2A6qqizvYzE2ObLZSMRHTl20TJODPKCFe3qWRPicKwHAcZ61ArfJUHvWQ7E18
         sHls2kWDnG14RLFEIA/+3cEBPFRJ6V+ExziaA2fy9d3eczFhLpynkx3v/Uaq/u2u0GAi
         CSqWUXmNHXyVISHvMSIknF+toesEjMf6848lc3meqs+PIxVvID8ppuzsnDk8nYQI8q76
         6ZqwGi3364h/ZbDBDveOsiyeA9IpPAkHaPEQEh+R1vAHi9fwPe+KwWDz7sN/P323be7P
         ocQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765165853; x=1765770653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFr5RgkhvM6EE5Q/RHn3oG8Xllt/H7Gtrl4Nvhbq1ik=;
        b=gdzVRyVnrcZiaXwWr9zZXbKSQhDlykGFAnKeB0ceJxMs9rjzyhtZoIRp7Ux2zmH/1S
         IbR3kQqGKSJncSaic+Mto6YnlGPNR60u2SerQdP0wRG4KOEck/yxcyNeFjPcELQMgE+H
         qfP6dxKjZnKJyaSuHuz4wVAIY8asZv0QZudonABehLAx7kc2V7uE3K610blPyMXcQ8hL
         QopLbFh4Uo2J15soTuhPz6SiB/EA9AJ9IqD59qguZx17Fg9K314POoggsoT3UDyHdZFd
         BEhoRzM58mAJgWs9JkIpPre6FC0onhls6+Znii0/rPjBdaH7k1zAVfOW5Q1ciwjYSmsD
         4kKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfcJ3Wbwi6f5fbXwo/O1EpwcWQgL6ha7YXXWAO/YVCrRcsAKb43YOC6eg1QbNSZMaoL4THPQY8sVtoPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzISHCWe/WRAkLcsFiMwAT5gqqImZSyyTcZ4jqAhiGZTd4ICXun
	zWwTrsjAXbJoBObStLZBxjeTFfxOYeUocte0PIgyzzDpQSYgbD9jsCpid/RpKvQrYfY=
X-Gm-Gg: ASbGncvcp0kMIsDs18lUfWUjmdNjnQZCbYu1r3am/Z9fcgvmAbHQVx5ngodmHehZexW
	Yl4V6cvyo+99VpGXx4aDq1olPFfe46iXYpQsb43v9zZGGpfM++M0zAT7eN4z2LWOLgjBbB9EIBI
	G+eYTAsp1BbmIXl4lAkewBK8Vpy9LvwptmBUg7PVfSJOh4AFUULWFtuhWwOak7Iprv9p/yN8rap
	UwSpmuZ4rQDDNcHvjlsM014fJyldE8YkxDc0Ux6RQzdVwwva8uCUR7j0BbzjJpwAabDwaW4/PEi
	CmAS11VPWliBYOtZo5gqKSYALKe4ypQpWiVwfHrEI1GkE+pefWsQ0uXT8iL48Q06/aiHXwVRMtU
	fYKtep7JFkcIdQru04ASVG+4OK+9tRvMsBudWqDu6Vvnn3cZHaHV80nbY2VU4w8JRjBHhIdowQw
	yXwAlYnm9GmYE6z3diek0ynMVtGqL70voEIErU+fbkC8GN
X-Google-Smtp-Source: AGHT+IGvReM+D+IE845FajcK0U2ifqJXm74OcYy9I6WIlw3gQeLkhNJjnOwLKfKhujYanWqb2gK1OA==
X-Received: by 2002:a17:903:15ce:b0:299:dea1:e791 with SMTP id d9443c01a7336-29df56772d0mr53566285ad.12.1765165852442;
        Sun, 07 Dec 2025 19:50:52 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6d96sm108871275ad.102.2025.12.07.19.50.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Dec 2025 19:50:52 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andii@kernel.org,
	andybnac@gmail.com,
	apatel@ventanamicro.com,
	ast@kernel.org,
	ben.dooks@codethink.co.uk,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	charlie@rivosinc.com,
	cl@gentwo.org,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	cyrilbur@tenstorrent.com,
	daniel@iogearbox.net,
	debug@rivosinc.com,
	dennis@kernel.org,
	eddyz87@gmail.com,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	martin.lau@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	puranjay@kernel.org,
	pulehui@huawei.com,
	ruanjinjie@huawei.com,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	sdf@fomichev.me,
	song@kernel.org,
	tglx@linutronix.de,
	tj@kernel.org,
	thuth@redhat.com,
	yonghong.song@linux.dev,
	yury.norov@gmail.com,
	zong.li@sifive.com
Subject: [PATCH v2 3/3] riscv: store percpu offset into thread_info
Date: Mon,  8 Dec 2025 11:49:44 +0800
Message-Id: <20251208034944.73113-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251208034944.73113-1-cuiyunhui@bytedance.com>
References: <20251208034944.73113-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_195053_458717_066FF2F6 
X-CRM114-Status: GOOD (  16.15  )
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

T3JpZ2luYWxseSB3ZSBwbGFubmVkIHRvIGFkZCBhIHJlZ2lzdGVyIGZvciB0aGUgcGVyY3B1IG9m
ZnNldCwKd2hpY2ggd291bGQgc3BlZWQgdXAgcGVyY3B1IHZhcmlhYmxlIFIvVyBhbmQgcmVkdWNl
IGFjY2VzcwppbnN0cnVjdGlvbnMuIEFmdGVyIGRpc2N1c3Npb24gWzFdLCBpdOKAmXMgbm93IHN0
b3JlZCBpbiB0aHJlYWRfaW5mby4KClsxXSBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gt
cHJpdmlsZWdlZC90b3BpYy9yaXNjX3ZfdGVjaF9hcmNoX3Jldmlldy8xMTM0Mzc1NTM/cGFnZT0y
CgpTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oICAgICAgICAgfCA2ICstLS0tLQogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZXJjcHUuaCAgICAgIHwgNCArKysrCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3N3aXRjaF90by5oICAgfCA4ICsrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3RocmVhZF9pbmZvLmggfCA1ICsrKy0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5j
ICAgICAgfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyAgICAgICAgICB8IDcgKysr
KysrKwogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyAgICAgIHwgOSArLS0tLS0tLS0K
IDcgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYXNtLmgKaW5kZXggZTllOGJhODNlNjMyZi4uMTM3YTQ5NDg4MzI1ZSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2FzbS5oCkBAIC05MSwxMSArOTEsNyBAQAogCiAjaWZkZWYgQ09ORklHX1NNUAogLm1hY3Jv
IGFzbV9wZXJfY3B1IGRzdCBzeW0gdG1wCi0JbHcgICAgXHRtcCwgVEFTS19USV9DUFVfTlVNKHRw
KQotCXNsbGkgIFx0bXAsIFx0bXAsIFJJU0NWX0xHUFRSCi0JbGEgICAgXGRzdCwgX19wZXJfY3B1
X29mZnNldAotCWFkZCAgIFxkc3QsIFxkc3QsIFx0bXAKLQlSRUdfTCBcdG1wLCAwKFxkc3QpCisJ
UkVHX0wgXHRtcCwgVEFTS19USV9QQ1BVX09GRlNFVCh0cCkKIAlsYSAgICBcZHN0LCBcc3ltCiAJ
YWRkICAgXGRzdCwgXGRzdCwgXHRtcAogLmVuZG0KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGVyY3B1LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BlcmNwdS5oCmluZGV4
IGIxNzM3Mjk5MjYxMjYuLjE4ZTI4MmRkZWQ2MjYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGVyY3B1LmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZXJjcHUuaApA
QCAtNyw3ICs3LDkgQEAKIAogI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS1tYWNyb3MuaD4KICNp
bmNsdWRlIDxhc20vY3B1ZmVhdHVyZS1tYWNyb3MuaD4KKyNpbmNsdWRlIDxhc20vY3VycmVudC5o
PgogI2luY2x1ZGUgPGFzbS9od2NhcC5oPgorI2luY2x1ZGUgPGFzbS90aHJlYWRfaW5mby5oPgog
CiAjZGVmaW5lIFBFUkNQVV9SV19PUFMoc3opCQkJCQkJXAogc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBsb25nIF9fcGVyY3B1X3JlYWRfIyNzeih2b2lkICpwdHIpCQlcCkBAIC0yMzMsNiArMjM1LDgg
QEAgX3BjcF9wcm90ZWN0X3JldHVybihfX3BlcmNwdV9hZGRfcmV0dXJuX2Ftb19jYXNlXzY0LCBw
Y3AsIHZhbCkKIAlyZXRfXzsJCQkJCQkJCVwKIH0pCiAKKyNkZWZpbmUgX19teV9jcHVfb2Zmc2V0
ICgoKHN0cnVjdCB0aHJlYWRfaW5mbyAqKWN1cnJlbnQpLT5wY3B1X29mZnNldCkKKwogI2luY2x1
ZGUgPGFzbS1nZW5lcmljL3BlcmNwdS5oPgogCiAjZW5kaWYgLyogX19BU01fUEVSQ1BVX0ggKi8K
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90by5oCmluZGV4IDBlNzFlYjgyZjkyMGMuLjczM2I2Y2Qz
MDZlNDAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaApAQCAtODgsNiArODgsMTMgQEAg
c3RhdGljIGlubGluZSB2b2lkIF9fc3dpdGNoX3RvX2VudmNmZyhzdHJ1Y3QgdGFza19zdHJ1Y3Qg
Km5leHQpCiAJCQk6OiAiciIgKG5leHQtPnRocmVhZC5lbnZjZmcpIDogIm1lbW9yeSIpOwogfQog
CitzdGF0aWMgaW5saW5lIHZvaWQgX19zd2l0Y2hfdG9fcGNwdV9vZmZzZXQoc3RydWN0IHRhc2tf
c3RydWN0ICpuZXh0KQoreworI2lmZGVmIENPTkZJR19TTVAKKwluZXh0LT50aHJlYWRfaW5mby5w
Y3B1X29mZnNldCA9IF9fbXlfY3B1X29mZnNldDsKKyNlbmRpZgorfQorCiBleHRlcm4gc3RydWN0
IHRhc2tfc3RydWN0ICpfX3N3aXRjaF90byhzdHJ1Y3QgdGFza19zdHJ1Y3QgKiwKIAkJCQkgICAg
ICAgc3RydWN0IHRhc2tfc3RydWN0ICopOwogCkBAIC0xMjIsNiArMTI5LDcgQEAgZG8gewkJCQkJ
CQlcCiAJaWYgKHN3aXRjaF90b19zaG91bGRfZmx1c2hfaWNhY2hlKF9fbmV4dCkpCVwKIAkJbG9j
YWxfZmx1c2hfaWNhY2hlX2FsbCgpOwkJXAogCV9fc3dpdGNoX3RvX2VudmNmZyhfX25leHQpOwkJ
CVwKKwlfX3N3aXRjaF90b19wY3B1X29mZnNldChfX25leHQpOwkJXAogCSgobGFzdCkgPSBfX3N3
aXRjaF90byhfX3ByZXYsIF9fbmV4dCkpOwkJXAogfSB3aGlsZSAoMCkKIApkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS90aHJlYWRfaW5mby5oCmluZGV4IDM2OTE4YzkyMDBjOTIuLjhkN2Q0M2NjOWM0MDUgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAorKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKQEAgLTUyLDcgKzUyLDggQEAKICAqLwog
c3RydWN0IHRocmVhZF9pbmZvIHsKIAl1bnNpZ25lZCBsb25nCQlmbGFnczsJCS8qIGxvdyBsZXZl
bCBmbGFncyAqLwotCWludCAgICAgICAgICAgICAgICAgICAgIHByZWVtcHRfY291bnQ7ICAvKiAw
PT5wcmVlbXB0aWJsZSwgPDA9PkJVRyAqLworCWludAkJCXByZWVtcHRfY291bnQ7CS8qIDA9PnBy
ZWVtcHRpYmxlLCA8MD0+QlVHICovCisJaW50CQkJY3B1OwogCS8qCiAJICogVGhlc2Ugc3RhY2sg
cG9pbnRlcnMgYXJlIG92ZXJ3cml0dGVuIG9uIGV2ZXJ5IHN5c3RlbSBjYWxsIG9yCiAJICogZXhj
ZXB0aW9uLiAgU1AgaXMgYWxzbyBzYXZlZCB0byB0aGUgc3RhY2sgaXQgY2FuIGJlIHJlY292ZXJl
ZCB3aGVuCkBAIC02MCw4ICs2MSw4IEBAIHN0cnVjdCB0aHJlYWRfaW5mbyB7CiAJICovCiAJbG9u
ZwkJCWtlcm5lbF9zcDsJLyogS2VybmVsIHN0YWNrIHBvaW50ZXIgKi8KIAlsb25nCQkJdXNlcl9z
cDsJLyogVXNlciBzdGFjayBwb2ludGVyICovCi0JaW50CQkJY3B1OwogCXVuc2lnbmVkIGxvbmcJ
CXN5c2NhbGxfd29yazsJLyogU1lTQ0FMTF9XT1JLXyBmbGFncyAqLworCXVuc2lnbmVkIGxvbmcJ
CXBjcHVfb2Zmc2V0OwogI2lmZGVmIENPTkZJR19TSEFET1dfQ0FMTF9TVEFDSwogCXZvaWQJCQkq
c2NzX2Jhc2U7CiAJdm9pZAkJCSpzY3Nfc3A7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9hc20tb2Zmc2V0cy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwppbmRleCBh
ZjgyNzQ0OGE2MDllLi5mYmY1M2I2NmIwZTA2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9hc20tb2Zmc2V0cy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKQEAg
LTM4LDYgKzM4LDcgQEAgdm9pZCBhc21fb2Zmc2V0cyh2b2lkKQogCU9GRlNFVChUQVNLX1RIUkVB
RF9TVU0sIHRhc2tfc3RydWN0LCB0aHJlYWQuc3VtKTsKIAogCU9GRlNFVChUQVNLX1RJX0NQVSwg
dGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLmNwdSk7CisJT0ZGU0VUKFRBU0tfVElfUENQVV9PRkZT
RVQsIHRhc2tfc3RydWN0LCB0aHJlYWRfaW5mby5wY3B1X29mZnNldCk7CiAJT0ZGU0VUKFRBU0tf
VElfUFJFRU1QVF9DT1VOVCwgdGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLnByZWVtcHRfY291bnQp
OwogCU9GRlNFVChUQVNLX1RJX0tFUk5FTF9TUCwgdGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLmtl
cm5lbF9zcCk7CiAJT0ZGU0VUKFRBU0tfVElfVVNFUl9TUCwgdGFza19zdHJ1Y3QsIHRocmVhZF9p
bmZvLnVzZXJfc3ApOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCmluZGV4IGQ4NTkxNmEzNjYwYzMuLjllOTVjMDY4
Yjk2NmIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zbXBib290LmMKQEAgLTIwOSw2ICsyMDksMTEgQEAgaW50IF9fY3B1X3Vw
KHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCB0YXNrX3N0cnVjdCAqdGlkbGUpCiB9CiAjZW5kaWYK
IAordm9pZCBfX2luaXQgc21wX3ByZXBhcmVfYm9vdF9jcHUodm9pZCkKK3sKKwlfX215X2NwdV9v
ZmZzZXQgPSBwZXJfY3B1X29mZnNldChzbXBfcHJvY2Vzc29yX2lkKCkpOworfQorCiB2b2lkIF9f
aW5pdCBzbXBfY3B1c19kb25lKHVuc2lnbmVkIGludCBtYXhfY3B1cykKIHsKIH0KQEAgLTIzNCw2
ICsyMzksOCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSB2b2lkIHNtcF9jYWxsaW4odm9pZCkKIAlt
bWdyYWIobW0pOwogCWN1cnJlbnQtPmFjdGl2ZV9tbSA9IG1tOwogCisJX19teV9jcHVfb2Zmc2V0
ID0gcGVyX2NwdV9vZmZzZXQoc21wX3Byb2Nlc3Nvcl9pZCgpKTsKKwogI2lmZGVmIENPTkZJR19I
T1RQTFVHX1BBUkFMTEVMCiAJY3B1aHBfYXBfc3luY19hbGl2ZSgpOwogI2VuZGlmCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb21wNjQuYwppbmRleCA1Zjk0NTdlOTEwZTg3Li40YTQ5MmE2YTFjYzFlIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCisrKyBiL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29tcDY0LmMKQEAgLTEzNDUsMTUgKzEzNDUsOCBAQCBpbnQgYnBmX2ppdF9lbWl0
X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQg
KmN0eCwKIAkJCWlmIChyZCAhPSBycykKIAkJCQllbWl0X212KHJkLCBycywgY3R4KTsKICNpZmRl
ZiBDT05GSUdfU01QCi0JCQkvKiBMb2FkIGN1cnJlbnQgQ1BVIG51bWJlciBpbiBUMSAqLwotCQkJ
ZW1pdF9sdyhSVl9SRUdfVDEsIG9mZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgY3B1KSwKKwkJ
CWVtaXRfbHcoUlZfUkVHX1QxLCBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2luZm8sIHBjcHVfb2Zm
c2V0KSwKIAkJCQlSVl9SRUdfVFAsIGN0eCk7Ci0JCQkvKiBMb2FkIGFkZHJlc3Mgb2YgX19wZXJf
Y3B1X29mZnNldCBhcnJheSBpbiBUMiAqLwotCQkJZW1pdF9hZGRyKFJWX1JFR19UMiwgKHU2NCkm
X19wZXJfY3B1X29mZnNldCwgZXh0cmFfcGFzcywgY3R4KTsKLQkJCS8qIEdldCBhZGRyZXNzIG9m
IF9fcGVyX2NwdV9vZmZzZXRbY3B1XSBpbiBUMSAqLwotCQkJZW1pdF9zaDNhZGQoUlZfUkVHX1Qx
LCBSVl9SRUdfVDEsIFJWX1JFR19UMiwgY3R4KTsKLQkJCS8qIExvYWQgX19wZXJfY3B1X29mZnNl
dFtjcHVdIGluIFQxICovCi0JCQllbWl0X2xkKFJWX1JFR19UMSwgMCwgUlZfUkVHX1QxLCBjdHgp
OwogCQkJLyogQWRkIHRoZSBvZmZzZXQgdG8gUmQgKi8KIAkJCWVtaXRfYWRkKHJkLCByZCwgUlZf
UkVHX1QxLCBjdHgpOwogI2VuZGlmCi0tIAoyLjM5LjUKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
