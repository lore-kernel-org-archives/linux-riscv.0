Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6EBD6ACF9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9k91n/2uKtNjtcucJhzthGZEuknWJJoBpLRwAipMgo=; b=zrc7EW5rcWQ6M/
	+1et48NtvBdy0AOFGrEgKBGD79fEwloPFgNcRyqSdHdWT1yf1jYUHLutaC1Cnw+BVu6AjPMmmbxRy
	/ojnZ47YD/hxNsz28DbsY2cucW9y/tiziKd4QhNciaffh8EEmmI4y6vIgSOtMDYopBz5ynhLzHhsv
	iB/GWoh33TdQD+wewtKGZoo5E6YH3ecmD7YixTWNZ6DJOLj7fGIxhpiOrX2mB6xkpTK9sGYGiR8LQ
	b7My8mw4PYyiKkSMEjt/0pyY1eBY+v+eG4NTrlww3Ck+7jIPLvooXcMorXGdSWx5MlxOlVIcyIjPM
	ye1GUKxdZcS2+9ooBc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrU-0000000DkQO-2O2a;
	Wed, 27 Nov 2024 17:30:00 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrS-0000000DkPK-3GKc
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 17:30:00 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7ee7e87f6e4so5797203a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 09:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732728598; x=1733333398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUtTSvLb/awnb4pf5MloBg9/ARoAYzcuulYeAOWZ3lk=;
        b=gVo4XzzxU0i8UYKuCxxZH8XpaP+Ymf5SxLagcPzx70mly9Ou+jnZm8KuQM6XeLJGqM
         sZtbRDSYdnuZ0LroGfe7lT+Jgu/0PEbHtgwZmCZPBJkcFY7briI06MaEmH90gCaeU4F5
         tud6v4nZWt4dadcgQc2HIJy0753WT5+p98Eyj6ZYfzlj5x8vsnc29GdH04psvgu7Gldv
         z7PjFYlp3vA6s2LfPcyojEWOPwJX5bZzA4M3Ay54NCvMYeakNhYlPhEEKPtIMchOyBvV
         1UaHIsgkGVWsPUwqagCt6LXESs4xkBt2nZqDvt7EHrFWrn4b51a2smw7qnHa6Dmi1IvN
         etWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728598; x=1733333398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUtTSvLb/awnb4pf5MloBg9/ARoAYzcuulYeAOWZ3lk=;
        b=WJocFrdh1o7g9o0mjpdfNxcI7OeZazf5mKSvTbru69Q8RkSBpK82i7hY91nuSk8wJy
         8rJJaSMabA/WNheioweUA4vhARGc4QknxSpUCHB1o2c6stMwmFYeR6IxlMQUsIu7ksCD
         mmX+W4unGt37KyIhcrMyHLBjdF5XEA9Dfqn8Qk0wJwvi/D+s7M05/7ky4GUNVABmhAa0
         b0FXEdxJ6wQ9zWddV3DgqvE8VZ9IE6BuVqSbsL00LeB2kzu9JOV8dRcvzdvsaj+WNFb9
         oT6EP2K/daP6Smp5B0OVxQdJZGvFsNeJmsUWMLQLPEx8Za5yGM2TBxkDrSG+Hf2MNKu5
         I7Aw==
X-Gm-Message-State: AOJu0Yxa2PiKu1A6JFhtlPlfRFG1ck7CtNrn6Z0/vBh2SOuG+5UrosxS
	7Ws+A0s3vHDMW/9+uMi43kjEIDpY2ntxrTTMus0mN4VVjQA9mXQX
X-Gm-Gg: ASbGncu42PAQLO9pwzlXnbHg0js59Ng9+nk+2r6IKvCVXuqNqg4H16GbwKP7/NSbM46
	xNNeH3LZpXQ4mfA9/AwPiE4iECk8BgLmuzPTI8BZuEGA4YEc7mJwTkmT3wmmEHr+6UhWBLOAoBE
	5RKC+u2wrl/NDvNpQYf5tbr3xGlxcK7INEoIPgoOoM4i9/pEQKcuaMj7qgTnLx8Dk9n9ObfjZpr
	GG2659f9uFBCkaQNrU2AE+GAVz51W/PK+teBDVYaU5Kj5oN0JzwSSUNrGZVZdq3Gu/5y/GzRVuq
	IdcejUecri+WgqeLIKFOgkV0gjqJ
X-Google-Smtp-Source: AGHT+IGZTrwY9TsRiJj+/2qS9smtrrSi2Kd6N3yOUCcWlvOO+wK88Dm28z0bcTIf0ysSO3Z6//fqeQ==
X-Received: by 2002:a05:6a20:6a09:b0:1e0:cfa5:e32e with SMTP id adf61e73a8af0-1e0e0b8b8eemr5787909637.44.1732728598105;
        Wed, 27 Nov 2024 09:29:58 -0800 (PST)
Received: from localhost.localdomain (1-171-29-17.dynamic-ip.hinet.net. [1.171.29.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm9359582a12.30.2024.11.27.09.29.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Nov 2024 09:29:57 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	tommy.wu@sifive.com,
	eric.lin@sifive.com,
	viccent.chen@sifive.com,
	zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v3 2/7] riscv: ftrace: align patchable functions to 4 Byte boundary
Date: Thu, 28 Nov 2024 01:29:03 +0800
Message-Id: <20241127172908.17149-3-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_092958_814011_FCBA2765 
X-CRM114-Status: GOOD (  11.84  )
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
YXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IDViZGRhODZhZGEz
Ny4uNzVhNWViZGU0NDI3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKKysrIGIvYXJj
aC9yaXNjdi9LY29uZmlnCkBAIC0xNDIsNiArMTQyLDcgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0
IEhBVkVfREVCVUdfS01FTUxFQUsKIAlzZWxlY3QgSEFWRV9ETUFfQ09OVElHVU9VUyBpZiBNTVUK
IAlzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRSBpZiAhWElQX0tFUk5FTCAmJiBNTVUgJiYgKENM
QU5HX1NVUFBPUlRTX0RZTkFNSUNfRlRSQUNFIHx8IEdDQ19TVVBQT1JUU19EWU5BTUlDX0ZUUkFD
RSkKKwlzZWxlY3QgRlVOQ1RJT05fQUxJR05NRU5UXzRCIGlmIEhBVkVfRFlOQU1JQ19GVFJBQ0Ug
JiYgUklTQ1ZfSVNBX0MKIAlzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9D
QUxMUwogCXNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfQVJHUyBpZiBIQVZFX0RZTkFN
SUNfRlRSQUNFCiAJc2VsZWN0IEhBVkVfRlRSQUNFX01DT1VOVF9SRUNPUkQgaWYgIVhJUF9LRVJO
RUwKQEAgLTIyNiw2ICsyMjcsNyBAQCBjb25maWcgQ0xBTkdfU1VQUE9SVFNfRFlOQU1JQ19GVFJB
Q0UKIGNvbmZpZyBHQ0NfU1VQUE9SVFNfRFlOQU1JQ19GVFJBQ0UKIAlkZWZfYm9vbCBDQ19JU19H
Q0MKIAlkZXBlbmRzIG9uICQoY2Mtb3B0aW9uLC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTgp
CisJZGVwZW5kcyBvbiBDQ19IQVNfTUlOX0ZVTkNUSU9OX0FMSUdOTUVOVCB8fCAhUklTQ1ZfSVNB
X0MKIAogY29uZmlnIEhBVkVfU0hBRE9XX0NBTExfU1RBQ0sKIAlkZWZfYm9vbCAkKGNjLW9wdGlv
biwtZnNhbml0aXplPXNoYWRvdy1jYWxsLXN0YWNrKQotLSAKMi4zOS4zIChBcHBsZSBHaXQtMTQ1
KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
