Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07538C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvzHY0vgFhpc5Yvs80k85Lv845kl7npf/65RTdOeRqc=; b=uIpkaxyHdXyGSl9ZeG0hwMBDeC
	QprNWKscmNrM0MWF7VXhTTBO5vxMBDMrB3ggkEPSDuhVvFFHsJAjxweIu7I7gk2hdHrhpoY2uZCM6
	d+hkTj+jwdLQBID5KLjNN5BkLIK6vPQpEEE3P9GN+KPvlDNvyiH2jprmm0dD6s/Ere6J45yEfMi+1
	Gorw5WWJ4guuKFZsZVwOgzOxWjhUbpWYaSnbuHHgXvFBlFD6hFCW7YHFYBEpqT1vqAnrzXBkzFLBN
	oheE0330jzTx8ZtXkqFNc0UxrcyGG3srVO/7uspVjjyS5u3L/UbotrNQIkMHegk8RIi6sxxTpr/0Q
	js6G3Osg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zjl-0000000Enko-24VI;
	Thu, 24 Apr 2025 16:47:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ze9-0000000Emxx-0ajL
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 16:41:58 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so1095698b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745512916; x=1746117716; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k6m4QSCkOjvBeG8/Kperh6wZuRGbtha7PIChY6FuIlM=;
        b=wjr/8w7EuPAuNncqBCw8FZwZ5xMD2a0z9wi1qls6JD/KQAFtL2Wz+6cp6OVGop9t8Q
         AE1DnWIpPJNiPqEOGYTuwsG3kUv176A/NON5uYjaF4/Qz+sUHIdKM4TAa7Tup/Sa/AkO
         /c6In0nSCQ09nP5mcKN1Cwvl8uhXCKRpB7IFvWOgM6PmsJ/5kSisYQKvJ/h/M9+wVgzv
         WH17MChN3RHdoIpFE1WYamY8Q+oryOfAdjGSwopLxVQnoAYr2lQ26jq1o8eNFN4gKpxV
         VCQX0OYWlXF2PuPEB4kkDF/tuTFJJm77M1pFFxKO8QeJ7w8OOhm8XSAheweaBXNklxLR
         x4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512916; x=1746117716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6m4QSCkOjvBeG8/Kperh6wZuRGbtha7PIChY6FuIlM=;
        b=nJJ27ZguTGxELxnK3vqZ53MPDgw09JEQSuj1ssuVqdcKi8GaiQJNYF+6J+J1jnVGMN
         SkBhutNFZWlQQggWQvA8xzqa1CHRZVD+TgC39Z62HnkUagA2DhT5tK+cDPGm5pi+sKX9
         aYnDyqXxwVoGznVFkPtv9uwuxzLWRBTp9llpNSWRQHftQnOE++rA17w3Gb7scWvGaWMA
         z/jl9pAaRSpwVFqY6ZTgpXeFEnIilSrevcAGQFyDCjEFTvEgea2IDPL5JduwNsqQ5Dhg
         pAx27a5WA3wwfCN9JVTzsc9EHetNl4Rt7dHhLOcFpX1vcNsM22JxIF14LZiUtnsIghVt
         CLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT9P16vcOhP5xpOG5X5gaB4CJGxeQ/qnXPxvqXYrh7pBWecoRy8eN/rJLrZDlUGk5N1WokoHVWDIrw0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxiDbk9fH/J+Ya7HM4zU8xCHE3OBLVOGJ0k0HJFi88x0A7aOdU
	/ht9xmRvvbCR7RZhfl9aTe2vnOD0lcmhN9CuEe2xnCUg0PG0F/p2bJWPol+UIMo=
X-Gm-Gg: ASbGncuNtUWpEedu1UulEgDQxqJaq9jyI9z8iVnhEaGN1a2rhdUJorfy1JMwLjdr7yi
	h+hBr7rA80RJpYvsUwd++It44PxEV0WX7SFNTmdDV92ZAagItSlT06JZ+PrWtI/04/3TVYkF+f3
	OUrRMTXd8+Hc1ZAcZN4OXWX9tC2vV9irL1wlYNMc8NQw2xrHmC2BvHI3mEPskZAmB/zbxpihHBG
	BkPLT/vRLToiqe+XAoWd9qoT6yJO1VgwnIO0Nd7H61ItALWlxlBKKsepTXxrUWDPZQKm6Q+47wm
	mQ85hgOmvJQx6a9Vg4bWvz4iYF+iJlcrlymTbTkTuxj+GS+SUi8=
X-Google-Smtp-Source: AGHT+IGxyp+KENwVEkLGrt7S8pn2vlKD8bBJVWEd1Iv8ULUIPojD/9R2kqNR1Mge6+txkrxVbJHCXA==
X-Received: by 2002:a05:6a21:6d8e:b0:1f5:8072:d7f3 with SMTP id adf61e73a8af0-20444fc0e44mr4794400637.30.1745512916109;
        Thu, 24 Apr 2025 09:41:56 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f48b2sm1462741a12.8.2025.04.24.09.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:41:55 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:41:51 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Miquel =?iso-8859-1?Q?Sabat=E9_Sol=E0?= <mikisabate@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v13 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration
 in hwprobe
Message-ID: <aAppz5o2i4SQKU2z@debug.ba.rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
 <20250424-v5_user_cfi_series-v13-20-971437de586a@rivosinc.com>
 <680a0cd4.050a0220.296475.3867@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <680a0cd4.050a0220.296475.3867@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094157_311516_FBB3C92D 
X-CRM114-Status: GOOD (  14.18  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMTI6MDU6MDRQTSArMDIwMCwgTWlxdWVsIFNhYmF0w6kg
U29sw6Agd3JvdGU6Cj5PbiBkai4sIGTigJlhYnIuIDI0IDIwMjUsIERlZXBhayBHdXB0YSB3cm90
ZToKPgo+SGVsbG8sCj4KPj4gQWRkaW5nIGVudW1lcmF0aW9uIG9mIHppY2ZpbHAgYW5kIHppY2Zp
c3MgZXh0ZW5zaW9ucyBpbiBod3Byb2JlIHN5c2NhbGwuCj4+Cj4+IFJldmlld2VkLWJ5OiBab25n
IExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8
ZGVidWdAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9od3Byb2JlLmggfCAyICsrCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAg
ICAgIHwgMiArKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4+IGluZGV4IGMzYzFjYzk1MWNiOS4uYzFi
NTM3YjUwMTU4IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPj4g
QEAgLTczLDYgKzczLDggQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewo+PiAgI2RlZmluZQkJUklT
Q1ZfSFdQUk9CRV9FWFRfWkNNT1AJCSgxVUxMIDw8IDQ3KQo+PiAgI2RlZmluZQkJUklTQ1ZfSFdQ
Uk9CRV9FWFRfWkFXUlMJCSgxVUxMIDw8IDQ4KQo+PiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfU1VQTQkJKDFVTEwgPDwgNDkpCj4+ICsjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUNG
SUxQCSgxVUxMIDw8IDUwKQo+PiArI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklDRklTUwko
MVVMTCA8PCA1MSkKPgo+Tm90aWNlIHRoYXQsIGFzIGl0IHN0YW5kcyBpbiBMaW51eCB2Ni4xNS1y
YywgdGhpcyB3aWxsIGNvbmZsaWN0IHdpdGggdGhlCj52YWx1ZXMgZm9yIFppY250ciBhbmQgWmlo
cG0uIFNlZSA0NDU4YjhmNjhkYzcgKCJyaXNjdjogaHdwcm9iZTogZXhwb3J0Cj5aaWNudHIgYW5k
IFppaHBtIGV4dGVuc2lvbnMiKS4gSSdkIHNheSB0aGF0IHlvdSBzaG91bGQgdXBkYXRlIHRoZXNl
Cj52YWx1ZXMuCgpHb3QgaXQuIE5vdGVkIGZvciBuZXh0IHZlcnNpb24uCgo+Cj4+ICAjZGVmaW5l
IFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1Cj4+ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JF
X01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQo+PiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9N
SVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+PiBp
bmRleCBiY2QzYjgxNjMwNmMuLmQ4MDJmZjcwNzkxMyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jCj4+IEBAIC0xMDgsNiArMTA4LDggQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0
MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPj4gIAkJRVhUX0tFWShaQ0IpOwo+PiAgCQlF
WFRfS0VZKFpDTU9QKTsKPj4gIAkJRVhUX0tFWShaSUNCT1opOwo+PiArCQlFWFRfS0VZKFpJQ0ZJ
TFApOwo+PiArCQlFWFRfS0VZKFpJQ0ZJU1MpOwo+PiAgCQlFWFRfS0VZKFpJQ09ORCk7Cj4+ICAJ
CUVYVF9LRVkoWklISU5UTlRMKTsKPj4gIAkJRVhUX0tFWShaSUhJTlRQQVVTRSk7Cj4KPkdyZWV0
aW5ncywKPk1pcXVlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
