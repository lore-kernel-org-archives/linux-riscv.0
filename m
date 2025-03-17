Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22625C35FF9
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKI/BsioI2UQQaiZCqLWoBNQg6G5MxfSsT3OH/rkjek=; b=gvfV5wWGSN2HXb
	ozoHl4J5w+YCUT9kpkPZjQ1G1cN+4fGlvYwA9JqjtpaFLgCAcaOf6feuY3ycf25AKOO2JF3+QQiKW
	dC56lfK4xFSRpVOZmU9dOuzxeFovG08RRuAwtXcaI3fJkhbTFKZ/flJA8wpcR7ZmR5sUYCShr5Lak
	4GQ5BqvrHj/NM5vg5e4ZJTiD6BR1GRL3bnla+AulFME0gJFYXWt9tFnxtt9v6aa3R6lY96sEvbWiC
	2EwX3E0FKAWSEXEGYCLFUMBT6qfAomtCome8l+m78H0ePDZtB17gvlViLCqCcD67WgnBwtFzinifc
	Qkg1hEeZxa9F6bGVGA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1U-00000003V42-1nUV;
	Mon, 17 Mar 2025 17:13:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwn-00000003TSq-1SJd
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso23622865e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231296; x=1742836096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AU7F+Sv/M47Pn2Qo6/tW45mjDMKI8ET1F5gpFniyHfw=;
        b=XvOqAcqW3EODMwaL38JCt+9VYNoTPC7k1h7c+rESb6sP6w9+OXuoYJUsxIYNd7MRzZ
         GGJKfSg23AsGOvaKntKUoZh7F2j4FMi5rWbi6ueC0eCgJLraIV0pX3y9rcxLJhZFl4ox
         svLiXuq6ZYT4Z4EFNeqb6Br0HYIKwLGggPMR93DXFblJ/OF6/gBnKdrJaEj7ES/cgsZS
         +zawXHGmdR8m/WIKFN0hAhPjLE8xq4uzpSjkrda6DTXBXRuoyrMWXuHxhoYNIG6k9upO
         1EhgWCYBRwuchOg3ZKW+gwy+RSxjt4xKPBzX0rNqfjrCKVMDIvJdrIRuMmpLq6m8Xqqw
         Iuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231296; x=1742836096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AU7F+Sv/M47Pn2Qo6/tW45mjDMKI8ET1F5gpFniyHfw=;
        b=Cn8Z4v9UEcV8U2Cm/dk1KY0xiPNZ1d5dYfqrSKJPI7Jnra/M5TT74vz6HCeXVW0a1V
         STzj3gT37aXYNjecg9YbgvxogemT55gg7CdH9RCJKfd/q/5dz+5XrbOVHfVMk27UMoh8
         SHoMdC1jwXJFFZ9ssCeqx6lWsqkS0EcE309/bgnspqjzrTjKhfuowvRWBS8B6c9A/QJU
         GNzya9eLPxiCZ6yI+J+WslM9/yE5x7LIbkAiJxV8pezYNt/ive1ruLKtI5xSSMXUY6bP
         heqQJ7NLsn4Vc4XurYpX1HS2B3Cesy5kYvjT5AtKEp0srQeIXgr4dhTrinhEPjejggfZ
         57uA==
X-Forwarded-Encrypted: i=1; AJvYcCUql93N/6rW010KjZ2j+WVfKJCBG9PYuU8q+49i5qbqycoGZuNvOimscc4u+x4j9/UDOuxOcNyl6xeHGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwR0jBlG1qcLWD7x3OtI0iuv9hPSE9ahh86OC7ChIfl37B4GHlr
	HZi7fkse1ueENL7LMRXhVm3yqOfpgRocy9++43bIv0g8CFlb/x3GUCEpKDmuKys=
X-Gm-Gg: ASbGncvIE8PtR0nIoxtCAM8iVgkGSPtu4cfCWW4I/uFSk+z6XqgAGTOdqoUrHRpO98+
	huJ7u+hgqEAWMCq8CQGaop2wiQ4KKnOKPHlM40otMKAqNXy4RecCL31UQiPjuXJ7q5vfFecRlnm
	LONqdJXnaNwu4grJzpSifQGgFSI/YbccsAxpJoSZsvh464NaqaokeYOwg6/ReK00za3/jYAi6l7
	50B45aFndOFeTF9xfYUFhDM18ia6lSJzcQGxVum7f1WaPr2ygR5q2qGhd6Ix35MTPOT3KCS0oEY
	iCbx68bSGqhoC4WW3ynhhYqNvUVZjm48xX9m9WMKgfm8vQ==
X-Google-Smtp-Source: AGHT+IGpDbXWpDYRUzGh2bTIaNirJTVxXi2O+kKj5FZQdCmID2IJ/McRsJVBPF2vymf5U0IMdZpfhQ==
X-Received: by 2002:a05:600c:3b9f:b0:43d:94:cff0 with SMTP id 5b1f17b1804b1-43d1ecd83demr128705695e9.19.1742231295702;
        Mon, 17 Mar 2025 10:08:15 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:15 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 08/18] riscv: misaligned: move emulated access uniformity check in a function
Date: Mon, 17 Mar 2025 18:06:14 +0100
Message-ID: <20250317170625.1142870-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100817_382918_8F23077D 
X-CRM114-Status: GOOD (  11.23  )
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

U3BsaXQgdGhlIGNvZGUgdGhhdCBjaGVjayBmb3IgdGhlIHVuaWZvcm1pdHkgb2YgbWlzYWxpZ25l
ZCBhY2Nlc3NlcwpwZXJmb3JtYW5jZSBvbiBhbGwgY3B1cyBmcm9tIGNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKQp0byBpdHMgb3duIGZ1bmN0aW9uIHdoaWNoIHdpbGwg
YmUgdXNlZCBmb3IgZGVsZWdhdGlvbiBjaGVjay4gTm8KZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVu
ZGVkLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
PgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAxOCArKysrKysrKysrKysr
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCA4MTc1YjM0NDliNzMuLjNjNzdm
Yzc4ZmU0ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNjcyLDEwICs2
NzIsMjAgQEAgc3RhdGljIGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11
bGF0ZWQodW5zaWduZWQgaW50IGNwdSkKIAlyZXR1cm4gMDsKIH0KIAotYm9vbCBjaGVja191bmFs
aWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCitzdGF0aWMgYm9vbCBhbGxfY3B1
c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCh2b2lkKQogewogCWludCBjcHU7CiAK
Kwlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKKwkJaWYgKHBlcl9jcHUobWlzYWxpZ25lZF9hY2Nl
c3Nfc3BlZWQsIGNwdSkgIT0KKwkJICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJf
RU1VTEFURUQpCisJCQlyZXR1cm4gZmFsc2U7CisKKwlyZXR1cm4gdHJ1ZTsKK30KKworYm9vbCBj
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCit7CiAJLyoKIAkg
KiBXZSBjYW4gb25seSBzdXBwb3J0IFBSX1VOQUxJR04gY29udHJvbHMgaWYgYWxsIENQVXMgaGF2
ZSBtaXNhbGlnbmVkCiAJICogYWNjZXNzZXMgZW11bGF0ZWQgc2luY2UgdGFza3MgcmVxdWVzdGlu
ZyBzdWNoIGNvbnRyb2wgY2FuIHJ1biBvbiBhbnkKQEAgLTY4MywxMCArNjkzLDggQEAgYm9vbCBj
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAJICovCiAJb25f
ZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCwgTlVMTCwgMSk7CiAKLQlm
b3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKLQkJaWYgKHBlcl9jcHUobWlzYWxpZ25lZF9hY2Nlc3Nf
c3BlZWQsIGNwdSkKLQkJICAgICE9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1V
TEFURUQpCi0JCQlyZXR1cm4gZmFsc2U7CisJaWYgKCFhbGxfY3B1c191bmFsaWduZWRfc2NhbGFy
X2FjY2Vzc19lbXVsYXRlZCgpKQorCQlyZXR1cm4gZmFsc2U7CiAKIAl1bmFsaWduZWRfY3RsID0g
dHJ1ZTsKIAlyZXR1cm4gdHJ1ZTsKLS0gCjIuNDcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
