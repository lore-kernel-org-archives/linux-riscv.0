Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DC8C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 18:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YU48yOuOFJXVXagGEm3VgKdFx2OUE3YZNPNaGmUdhE8=; b=KHBV84A9h8d19K
	/MnBXVGwDpVbIXoysS0E2zKNAJvFS0dTPPOnkwDuoVcwGodZZHN4i9RFIZbqFl1iWu42lfSAluur3
	jxqzulDarOOd7LSAa3GYPuFJQyfTlCMiSlsiUwumxzmQScdayPCQvOWbx7OKdW+Na/78LLKFi1Vyw
	1FYil26or8X2dIb8FDNyxqfsQa1JBAdFBx94GX8xrJwDkjCCVVJHDQHTBfM/7XADn1FOyxRmm0CO1
	/3T7Gk7St2qrcN7XwsekbsrMU4fR5HCKPwBn3u2nKZgzCNyL6mljnwP5hS388vz/vdzKYzAGfzaGv
	euFGqd49hqlCtu0N7W0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruzFW-0000000Di09-14D3;
	Thu, 11 Apr 2024 18:34:14 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruzFT-0000000DhyQ-1GrX
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 18:34:12 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-479dcaaf2b1so51139137.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712860449; x=1713465249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stMEsNBdhDZHN0AAsq6vgx6+Ts1oyq4oANVAhdK9098=;
        b=1XE5poW6Jkjd75IZAnZQCrZVJi4aUoByF952NZZx92Jf4DSEVmy4ANTkoLsTA8K5fD
         3yAlhHTcbos5sOI4PgAOppGUxx95358kgRSf1ypt6oDyEEEdcaTHgxhZXhs06xLRBEU0
         8aXGSCJToFDt0FDAr91FzCRoaCNGdTYQlvfxxm8azIlIkoXSNiAhOBlBfM10dwSMNyf5
         Xhzixkrid7EPyUL00+D5ltLZGbOcaf3EKaPwZ9eIuoyTN843d18Q7crcjb6mIf4jGlSw
         fmmqmliDHDkZ0IWTiFERoywAWvVkg2fUisIiGiHSHvsO3LWn1tnLQd3Ck4D/hwK30bYB
         gazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712860449; x=1713465249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stMEsNBdhDZHN0AAsq6vgx6+Ts1oyq4oANVAhdK9098=;
        b=DMWemM/W/1EFVIIe2LVviBOCurCVmuYMUHzR0hPpFo2QXU6cJhEas66x7knQ98X5XY
         tLPps3Y74fK9LbaEOma5SdR0TdcXfmk8ol40M747Jq59sySI7+6fwKJCjNTovOHMg3ul
         LKszNwjtcB06PDn4HOKw7ipvedyE+3qvl2t9qB2GvnUW3WkPhfir45uwPuY7rxe9MqZk
         GHfKq5YfGvSx1V5x6CmcIBkRRKLg96Qx6mVi6oF9ptyHnbxDbCkrKQ2Zs0NJPuOaOC3g
         3oMhWFuP1c6wxaldnWF+ZCPnMsv1zvcqj6XUZnPPM2TiFACpG87B9S89wVBOYrc+squN
         Cb8g==
X-Gm-Message-State: AOJu0Yxl8KKX842LfrSSr9asgpXRPLWmq8b1Z/fxMUY3Q4GTy5vhxGqB
	/j1l5ym+8mYq7W/6N5pnnxxUIX8VCYUvSLUh8fFyav6t/S0pC188iM9QrhlE8E/gLrvp3nEuqKh
	WGenIrRJRHNAwns+cBC2QSUT+QnzIdhZvlWhm
X-Google-Smtp-Source: AGHT+IFfuK5+fQsC0QczQeo6WuoykTwpS5Kk4PpmnlC1hN0dL/Pi0+fTSQq1O1Njt6aog/wFbvvhl3lV/7VPrJZJ6bQ=
X-Received: by 2002:a05:6102:b08:b0:47a:36b9:160b with SMTP id
 b8-20020a0561020b0800b0047a36b9160bmr819522vst.16.1712860449222; Thu, 11 Apr
 2024 11:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240409061043.3269676-1-debug@rivosinc.com> <20240409061043.3269676-3-debug@rivosinc.com>
 <CABCJKuee-6GGDDjvByCkikR02gka2BNhwRVBw6UAwEcmSQposQ@mail.gmail.com> <ZhgjoyObf+nMihA4@debug.ba.rivosinc.com>
In-Reply-To: <ZhgjoyObf+nMihA4@debug.ba.rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 11 Apr 2024 18:33:33 +0000
Message-ID: <CABCJKuf5Jg5g3FVpU22vNUo4UituPEM7QwvcVP8YWrvSPK+onA@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] riscv: add landing pad for asm routines.
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, andy.chiu@sifive.com, 
	hankuan.chen@sifive.com, guoren@kernel.org, greentime.hu@sifive.com, 
	cleger@rivosinc.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
	conor.dooley@microchip.com, mchitale@ventanamicro.com, 
	dbarboza@ventanamicro.com, waylingii@gmail.com, sameo@rivosinc.com, 
	alexghiti@rivosinc.com, akpm@linux-foundation.org, shikemeng@huaweicloud.com, 
	rppt@kernel.org, charlie@rivosinc.com, xiao.w.wang@intel.com, 
	willy@infradead.org, jszhang@kernel.org, leobras@redhat.com, 
	songshuaishuai@tinylab.org, haxel@fzi.de, samuel.holland@sifive.com, 
	namcaov@gmail.com, bjorn@rivosinc.com, cuiyunhui@bytedance.com, 
	wangkefeng.wang@huawei.com, falcon@tinylab.org, viro@zeniv.linux.org.uk, 
	bhe@redhat.com, chenjiahao16@huawei.com, hca@linux.ibm.com, arnd@arndb.de, 
	kent.overstreet@linux.dev, boqun.feng@gmail.com, oleg@redhat.com, 
	paulmck@kernel.org, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_113411_371834_3E8A2D60 
X-CRM114-Status: GOOD (  10.61  )
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

T24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgNTo1M+KAr1BNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEluIHByaW5jaXBsZSwgSSBhZ3JlZSBpdCBzaG91bGQgY29u
dmVyZ2Ugd2l0aCBzb2Z0d2FyZSBiYXNlZCBrY2ZpIHNjaGVtZQo+IGFzIG11Y2ggYXMgcG9zc2li
bGUuIEhvd2V2ZXIgYmxvY2tlciB0aGF0IEkgc2VlIGlzIGBoYXNoYCBpcyBwbGFjZWQganVzdAo+
IGJlZm9yZSBmdW5jdGlvbi4gVGhpcyBicmVha3MgZm9yIGNvZGUgbWFwcGVkIGFzIGV4ZWN1dGUg
b25seSBzY2VuYXJpb3MuCj4gQW5kIGlkZWFsbHkgd291bGQgbGlrZSB0byBoYXZlIGltbWVkaWF0
ZXMgYXQgY2FsbHNpdGVzIGluc3RlYWQgb2YgbG9hZHMKPiAocHVyZWx5IHBlcmYgcmVhc29uIGFu
ZCBub3Qgc2VjdXJpdHkpLgoKSSdtIG5vdCBzYXlpbmcgdGhlIHNjaGVtZXMgaGF2ZSB0byBiZSBj
b21wYXRpYmxlLCBqdXN0IHRoYXQgaXQgd291bGQKYmUgZ3JlYXQgdG8gYXZvaWQgcmVpbnZlbnRp
bmcgdHlwZSBhbm5vdGF0aW9ucyBldGMuIEZvciBleGFtcGxlLCB3aGVuCnlvdSBpbXBsZW1lbnQg
dGhlIGZpbmUtZ3JhaW5lZCB2YXJpYW50LCB5b3UgY291bGQgc2ltcGx5IG92ZXJyaWRlClNZTV9U
WVBFRF9FTlRSWSAoZGVmaW5lZCBpbiBpbmNsdWRlL2xpbnV4L2NmaV90eXBlcy5oKSB0byBtb3Zl
Cl9fQ0ZJX1RZUEUgaW5zaWRlIHRoZSBmdW5jdGlvbiwgYW5kIHRoZW4gcmVkZWZpbmUgX19DRklf
VFlQRSB0byBlbWl0IGEKbGFuZGluZyBwYWQgd2l0aCB0aGUgY29ycmVjdCBsYWJlbC4gVGhpcyBh
bGxvd3MgU1lNX1RZUEVEXyogaW4KYXNzZW1ibHkgY29kZSB0byB3b3JrIHdpdGggYm90aCBLQ0ZJ
IGFuZCBmaW5lLWdyYWluZWQgWmljZmlscC4gRm9yIHRoZQpjb2Fyc2UtZ3JhaW5lZCB2YXJpYW50
LCB5b3VyIGN1cnJlbnQgbWFjcm9zIGFyZSBwZXJmZWN0bHkgZmluZS4KCj4gQnV0IHllcyBpbiBu
ZXh0IHZlcnNpb24sIEknbGwgdGFrZSBhIGxvb2sgYW5kIHRyeSB0byBjb252ZXJnZSBhcyBtdWNo
IGFzCj4gcG9zc2libGUuCgpHcmVhdCwgc291bmRzIGdvb2QhCgpTYW1pCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
