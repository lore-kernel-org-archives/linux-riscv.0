Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35FEC36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtSBOLzYvr/BUoKkfnhYFzVroa46KhjhO9zV8LFYa1M=; b=BdQnyl4Sdhcgr9
	1XM+ved5oU6fpE3lJge+x2fcsuyS0Xb2kr1qsoxEwp4nf2z3DSEPJ5RbYi0NoXLosTOjHmz/KewxI
	eueFgtthWggnDNVHDKn1uCZS30WAYMUx0fKvnMpOqqyJs2zTVbggfhXsBSMpUYX3DxUVAG+mpdMEQ
	aksXspaE8osBa4R/iTOeTgkSWGREu3tShutlmklrr6sBVRwsOsEwUg0EBi3NlN8kDeTbFznstsAkK
	AlzEHA51LZCHVKjLkS/XgRe5O0QA8G81LASiYSh4Nv6Uw/8r14TyoGg3tAoM8rCgNTsu4OW9uVkFo
	7QtP6uuXkD7Zmhi3zuoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ra9-00000001gD1-39FN;
	Mon, 07 Apr 2025 18:52:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qu6-00000001TS4-3LTl
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:09:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-223fd89d036so54977725ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049342; x=1744654142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUF0nsnlw7RZ2EpqP50Kib/oVdoqhGZKkeMwJl9c7jk=;
        b=WE0vuWI1ssFrE8GGJOjWVD8JTmSp7SpanSBQKM/WkWv19mC/oRHMuAmt1CiLP5TtMj
         ZpP4KBvIP2hTZYICE/Ukt5UBn918CUCs2GGV4Zk7lCoaQvJh6YTzmvQUsh1S08rG/w8C
         AVnkSY6cbs4toWP3Ca/CIXkDQO0jInp92o7U/2LA0DkqMRerN9/HR+RvIyf0082TDkn1
         6rd6jNE9ndqkeH/M3KDuG57wHOEnKA6eB8UynMUwomF7ogLfFt7Qt/NBiy4YmSa3Dgdk
         8Y0R/FFtmR5TIw41+yFM86xaqIeJmOaQ8nWvaYJkfQc5bnMqxu2uQDOPoGuOACjUNj+Z
         G0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049342; x=1744654142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUF0nsnlw7RZ2EpqP50Kib/oVdoqhGZKkeMwJl9c7jk=;
        b=Srlk/khKE/pYKfUdYtEmaqjA2wezV0FeirvImZaWyfwtpZXLoVArNwKlMvakzPxyOv
         lAoibtrnlbEgKjAbM5OP7aYAtKb3N280u3IhpVQ2MD/1+H7q4yViNmUkWDxEliADv8jS
         2oGh6i3FQFzHOIZmHtjYQ7LswJ2nezMd52IJt9eMhyAg/jINurNZBtbt0DJlHYyzXmt6
         a3gG0b1l8QKDhRx8akBrfcMPystRpmuazYq0PTlSB/ah6ad86pCgSSyN72nspMNT9j9j
         bP7J6PtCTX+jbP56m/Q9c/IFvqeFxDD7K1xWxTPCYvNZh7vrROVU1CTAIoS2Sz8CziH0
         kKpg==
X-Gm-Message-State: AOJu0YzOJ5qoI1ingSsYECZPTRfqzcYHnx3gV0VytelQqYaGbAugcdsv
	cwQQikWjNpftigLpEwfKqgf0N+nw13SqedQPehprESngaQPKH9ORBjpuPB9c
X-Gm-Gg: ASbGncsuaMEAihZPbgLyHr3VBiqcDWPWxjhM/46DPa7nfgVNrQdymgke3mvW67YZeLX
	N290DW2XiQWhKG5vmLXZbiVZbS39r/QHVMODozt8maeqMrWBeW6kq4OwlUQMFYV7ysYwb/hXAm5
	IzN0TMomzvK5X9uQK0HDd4dKift8Ap5gwX/qIVd7kgKuZTZKEcxTAYusPNn9dgp5bnVcZGxYK6h
	3GXu0+x5vWOoenuCFrY0eEJUjXCw1KaaBGy3ynOJkIRFwmQgq3GmR3T91djKSGx7D76yehths3B
	apgWA7HK+zqyjagBASRZ8XIU0X9ijg4kT1M9ssdWZkx9kSp70ZyEYzge0omUJy3IFe2tx32i12U
	M9ZUwMfV4OJO40hV1xFPgShI26h5/yMHR2PFrzbIfhwtA
X-Google-Smtp-Source: AGHT+IGoRDgmxduZEMyRWH4rWtb7Cl9qxilgGQO3cjliR6W+8rbaesJEGRduh+4SldUK1SWSm3N/ow==
X-Received: by 2002:a17:903:19e8:b0:223:4e54:d2c8 with SMTP id d9443c01a7336-22a8a058646mr194838985ad.21.1744049341737;
        Mon, 07 Apr 2025 11:09:01 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.08.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:01 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andy.chiu@sifive.com>,
	Evgenii Shatokhin <e.shatokhin@yadro.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 03/12] riscv: ftrace: align patchable functions to 4 Byte boundary
Date: Tue,  8 Apr 2025 02:08:27 +0800
Message-Id: <20250407180838.42877-3-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110902_834349_978D5268 
X-CRM114-Status: GOOD (  11.64  )
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

RnJvbTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KCldlIGFyZSBjaGFuZ2luZyBm
dHJhY2UgY29kZSBwYXRjaGluZyBpbiBvcmRlciB0byByZW1vdmUgZGVwZW5kZW5jeSBmcm9tCnN0
b3BfbWFjaGluZSgpIGFuZCBlbmFibGUga2VybmVsIHByZWVtcHRpb24uIFRoaXMgcmVxdWlyZXMg
dXMgdG8gYWxpZ24KZnVuY3Rpb25zIGVudHJ5IGF0IGEgNC1CIGFsaWduIGFkZHJlc3MuCgpIb3dl
dmVyLCAtZmFsaWduLWZ1bmN0aW9ucyBvbiBvbGRlciB2ZXJzaW9ucyBvZiBHQ0MgYWxvbmUgd2Fz
IG5vdCBzdHJvbmcKZW5vdW5naCB0byBhbGlnbiBhbGwgZnVuY3Rpb25zLiBJbiBmYWN0LCBjb2xk
IGZ1bmN0aW9ucyBhcmUgbm90IGFsaWduZWQKYWZ0ZXIgdHVybmluZyBvbiBvcHRpbWl6YXRpb25z
LiBXZSBjb25zaWRlciB0aGlzIGlzIGEgYnVnIGluIEdDQyBhbmQKdHVybiBvZmYgZ3Vlc3MtYnJh
bmNoLXByb2JpbGl0eSBhcyBhIHdvcmthcm91bmQgdG8gYWxpZ24gYWxsIGZ1bmN0aW9ucy4KCkdD
QyBidWcgaWQ6IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTg4
MzQ1CgpUaGUgb3B0aW9uIC1mbWluLWZ1bmN0aW9uLWFsaWdubWVudCBpcyBhYmxlIHRvIGFsaWdu
IGFsbCBmdW5jdGlvbnMKcHJvcGVybHkgb24gbmV3ZXIgdmVyc2lvbnMgb2YgZ2NjLiBTbywgd2Ug
YWRkIGEgY2Mtb3B0aW9uIHRvIHRlc3QgaWYKdGhlIHRvb2xjaGFpbiBzdXBwb3J0cyBpdC4KClN1
Z2dlc3RlZC1ieTogRXZnZW5paSBTaGF0b2toaW4gPGUuc2hhdG9raGluQHlhZHJvLmNvbT4KU2ln
bmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KUmV2aWV3ZWQtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L0tjb25m
aWcgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IGJiZWM4N2I3OTMw
OS4uN2RiZWQxMDg0M2QyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKKysrIGIvYXJj
aC9yaXNjdi9LY29uZmlnCkBAIC0xNTAsNiArMTUwLDcgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0
IEhBVkVfREVCVUdfS01FTUxFQUsKIAlzZWxlY3QgSEFWRV9ETUFfQ09OVElHVU9VUyBpZiBNTVUK
IAlzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRSBpZiAhWElQX0tFUk5FTCAmJiBNTVUgJiYgKENM
QU5HX1NVUFBPUlRTX0RZTkFNSUNfRlRSQUNFIHx8IEdDQ19TVVBQT1JUU19EWU5BTUlDX0ZUUkFD
RSkKKwlzZWxlY3QgRlVOQ1RJT05fQUxJR05NRU5UXzRCIGlmIEhBVkVfRFlOQU1JQ19GVFJBQ0Ug
JiYgUklTQ1ZfSVNBX0MKIAlzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9D
QUxMUwogCXNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfQVJHUyBpZiBIQVZFX0RZTkFN
SUNfRlRSQUNFCiAJc2VsZWN0IEhBVkVfRlRSQUNFX0dSQVBIX0ZVTkMKQEAgLTIzNiw2ICsyMzcs
NyBAQCBjb25maWcgQ0xBTkdfU1VQUE9SVFNfRFlOQU1JQ19GVFJBQ0UKIGNvbmZpZyBHQ0NfU1VQ
UE9SVFNfRFlOQU1JQ19GVFJBQ0UKIAlkZWZfYm9vbCBDQ19JU19HQ0MKIAlkZXBlbmRzIG9uICQo
Y2Mtb3B0aW9uLC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTgpCisJZGVwZW5kcyBvbiBDQ19I
QVNfTUlOX0ZVTkNUSU9OX0FMSUdOTUVOVCB8fCAhUklTQ1ZfSVNBX0MKIAogY29uZmlnIEhBVkVf
U0hBRE9XX0NBTExfU1RBQ0sKIAlkZWZfYm9vbCAkKGNjLW9wdGlvbiwtZnNhbml0aXplPXNoYWRv
dy1jYWxsLXN0YWNrKQotLSAKMi4zOS4zIChBcHBsZSBHaXQtMTQ1KQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
