Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FCFC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 21:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=evPQLrqkR5C7PmlHSBWF43WZ/kows+X39rQF/lF12uQ=; b=Ll27RoeRx4JdswoUSCTkWkxsUG
	iyiZEC6RIFMaO305Eb11veca88n133phLRt094Vx7HETcpZlaOFvI5CtTIvyXharSdPXK00pcVtzX
	HTNJKIy7dAyOVOIYrwwkg094JrP7J0kSUiTfZzAsT/1Yy4uPq+d1Sdm27700L1i0A2ApLohqzudLH
	J3yYnheYuNu+q7AY3eCWLHfORSyWLnzFba1DKkKezhSw9fUatnIy1p3KCMYuIU3tpiYJ9/3o7BAUW
	mUIby61vn43u5cN1v22UdVwM5y3K+Jcm0QKIwvMHC+iCLrH3EiK3iBA26Uv4HkN589TOX3SHFUz4g
	zyZ7el6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCn5J-00000008Row-0rkt;
	Thu, 30 May 2024 21:13:17 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCn5F-00000008RmP-0KBF
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 21:13:15 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-656d8b346d2so975267a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 14:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1717103591; x=1717708391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUpctKvfevQrHdaGpIcM44yzfFl2nDayUUMZ29nidi4=;
        b=sy21zc1gHYWRtmmciqvihAN+Mems1vnmp+LNVflYNmIyyGFxHV6wX3LQk+p1cnhSmS
         bizJGUashTPxTWBA3SN80Sxsw8JoiTUdgV5cmSRpjdAbcMHgso6uVhqyRmN3YgTmXoRZ
         AIR5FNi1NDCqOGhrK3Pk7Q3P53hmf+iB5uDA2B8smPZbQV9Nc8xBtfh3qmuZqZsOeg0n
         6atIbH86KhPjy1tVoE+6HdpuKNyrf3nsAhxfVI/g1tL05A3oaIEcFdYwFcaMfBpGZgxD
         bfkliwn1QYOgZh+1lD8lSHGjosynuXVT/OMkRIlxadAVLpXZYi7OTB5pYqYdNTsVlH8r
         ZQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717103591; x=1717708391;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUpctKvfevQrHdaGpIcM44yzfFl2nDayUUMZ29nidi4=;
        b=lyQN70Id37KJF3A5F4R36yLrjG11xCAv4sCWOabIqhLVedfnTy37ptfD/C6/BneqQ9
         SBmG0S5ryBwHxDJO9fq2h9Ta7GTVLLMdthhzSORxdoPznncyhtyqgU5bKpNkUYDEtfnT
         DQTJnfem7U0g+Gv3CNjuNuILPTslVSN9R8xsF+zF6TkHzzjt9r2kot/ndwZx+TS3ncPY
         rI6wQWIktjYAvpikStXC2I/YdwAG+U+E808YQ3VddFRZ0WfOAOf9Fet7y5FuMef1EcPD
         WMUC6InLxyWYxhCNT4xF5w4Pp6HFAk1QBseDzcFZdQogO0f1pHcqUpthOE0HV8w4K/Lq
         gD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOeVXQrYeIPYl/XaMr5p1s5PnR5zw7Vi+sCwppA4sMLg3OMnXu4/N3Gdx9glxwPRG0CRZ16YLMiF2Fl8JFPDVOembx2r4FGkTZiJS+Bjbd
X-Gm-Message-State: AOJu0Yx5oYmH5hKOQx8KzoqoX/WhBhB8hmnL0jXvvYu5FvSw47Fv33Sy
	GKvYyPl2GK1749yycEtE4wwIRGJygy+bN8ZnOoZeTP6WoCfgyieOHOYbAG9XDX4=
X-Google-Smtp-Source: AGHT+IG5bEF7vqEE2pvUr7TZyQpWPRiOExDqlbLZlE02H6bgGUcM0bCR65XCXs/V68DITptuE8d6Mg==
X-Received: by 2002:a17:90a:c914:b0:2c1:b66c:d414 with SMTP id 98e67ed59e1d1-2c1b66cd54dmr2280707a91.36.1717103591073;
        Thu, 30 May 2024 14:13:11 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1c27e3a5asm210516a91.30.2024.05.30.14.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 14:13:10 -0700 (PDT)
Date: Thu, 30 May 2024 14:13:10 -0700 (PDT)
X-Google-Original-Date: Thu, 30 May 2024 14:13:08 PDT (-0700)
Subject: Re: [PATCH v5 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
In-Reply-To: <de2c9064-bb01-42b2-9c0f-884dcabf7c40@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  anup@brainfault.org, shuah@kernel.org, atishp@atishpatra.org, linux-doc@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cleger@rivosinc.com
Message-ID: <mhng-d5016935-99b6-4dc6-bbd2-ed84eb834f98@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_141313_351069_A0FAE2F7 
X-CRM114-Status: GOOD (  15.34  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMiBNYXkgMjAyNCAwMDoyMDowOSBQRFQgKC0wNzAwKSwgY2xlZ2VyQHJpdm9zaW5j
LmNvbSB3cm90ZToKPgo+Cj4gT24gMjEvMDUvMjAyNCAyMTo0OSwgQ29ub3IgRG9vbGV5IHdyb3Rl
Ogo+PiBPbiBGcmksIE1heSAxNywgMjAyNCBhdCAwNDo1Mjo0OFBNICswMjAwLCBDbMOpbWVudCBM
w6lnZXIgd3JvdGU6Cj4+Cj4+PiArc3RhdGljIGludCByaXNjdl9leHRfemNhX2RlcGVuZHMoY29u
c3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPj4+ICsJCQkJIGNvbnN0IHVuc2ln
bmVkIGxvbmcgKmlzYV9iaXRtYXApCj4+PiArewo+Pj4gKwlyZXR1cm4gX19yaXNjdl9pc2FfZXh0
ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pDQSkgPyAwIDogLUVQ
Uk9CRV9ERUZFUjsKPj4+ICt9Cj4+PiArc3RhdGljIGludCByaXNjdl9leHRfemNkX3ZhbGlkYXRl
KGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEsCj4+PiArCQkJCSAgY29uc3Qg
dW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKPj4+ICt7Cj4+PiArCXJldHVybiBfX3Jpc2N2X2lz
YV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfWkNBKSAmJgo+
Pj4gKwkgICAgICAgX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBS
SVNDVl9JU0FfRVhUX2QpID8gMCA6IC1FUFJPQkVfREVGRVI7Cj4+PiArfQo+Pgo+PiBDb3VsZCB5
b3Ugd3JpdGUgdGhlIGxvZ2ljIGluIHRoZXNlIG91dCBub3JtYWxseSBwbGVhc2U/IEkgdGhpbmsg
dGhleSdkCj4+IGJlIG1vcmUgdW5kZXJzdGFuZGFibGUgKHBhcnRpY3VsYXIgdGhpcyBzZWNvbmQg
b25lKSBicm9rZW4gZG93biBhbmQgd2l0aAo+PiBlYXJseSByZXR1cm4uCj4KPiBZZXMgc3VyZS4g
SSdsbCBwcm9iYWJseSBtYWtlIHRoZSBzYW1lIHRoaW5nIGZvciB6Y2ZfdmFsaWRhdGUgYXMgd2Vs
bCBhcwo+IHJlbW92aW5nIHRoZSAjaWZkZWYgYW5kIHVzaW5nIElTX0VOQUJMRUQoKToKPgo+IHN0
YXRpYyBpbnQgcmlzY3ZfZXh0X3pjZl92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhICpkYXRhLAo+IAkJCQkgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCj4g
ewo+IAlpZiAoSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKQo+IAkJcmV0dXJuIC1FSU5WQUw7Cj4K
PiAJaWYgKF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1Zf
SVNBX0VYVF9aQ0EpICYmCj4gCSAgICBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlz
YV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfZikpCj4gCSAgICAgICByZXR1cm4gMDsKPgo+IAlyZXR1
cm4gLUVQUk9CRV9ERUZFUjsKPiB9CgpBcmUgeW91IGdvaW5nIHRvIHNlbmQgYSB2NiAoc29ycnkg
aWYgSSBtaXNzZWQgaXQsIEknbSB0cnlpbmcgdG8gdW50YW5nbGUgCmFsbCB0aGVzZSBJU0EgcGFy
c2luZyBwYXRjaCBzZXRzKS4KCj4KPj4KPj4gT3RoZXJ3aXNlLAo+PiBSZXZpZXdlZC1ieTogQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4KPj4gQ2hlZXJzLAo+PiBD
b25vci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
