Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC911076389
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oogmcqiu2YosCCi5XxuiO5sOBGw29/ODb7vapO6DcDo=; b=aNhorDpjsfuyrn
	Xu168XYI1aLLcCPtSSfl0DV3SqQmVBe/vh0NidXL6fmbqK/lDJFjrXwiemlV43G5d0CZaGQQHLIym
	tvkzXa1IRb2H9zXBILc3iCUBP6n/SvZdxBJ9GuFlOiLAAgP8KeCX0IqRxAa+cNGoKS/okovcTBBdh
	/h1VgZagGVl0/qKHsHOEmvDwz/hrJPw2qxE9WBYWD8E85CrIhOhcUYYDBDz8lzQgI12qG8xrPkA8Q
	T+S9I1aqUmuNZGj2CQlQPBCzewseJDeR3s4b8pouNNzqoex5uFwr+MzLNPpuGJDhhOvt5QtwtZzdi
	M4mzdc/UtCFOngGgOcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zUj-0000000FrQN-47oN;
	Wed, 01 Apr 2026 17:36:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zUh-0000000FrPy-3i4u
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Apr 2026 17:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=; b=OYyc/+nzIkA2nAzuw/4g4tm5A3
	PvGoCH0JpCdkhq5yKxtK09dAQdo2EFIYotXoCLf4Rmnu+hoEOl1pkA6L2foI/tSAkqdLRSCxDoL97
	ZZkKaU9rgheUz/JOiT03FBvqpYvd5lxD1hkfCskoe8GofvGtLkgtu3fiQXw0Puvouol2uGSJ2R/vP
	dQUdXx0vVcKuglM1dReHenpa2d6SYIWvSqUa/YDoq6p0eMZyvOvlOAvwe8iIMg4SKngaVQeIALcLI
	//qT1f+CXCpE4uGtLvbvcYXmR4YqYl0SNWK3/Udd+6Xd+lOSuxuu7Yso1HIYbsNi1xgSvGvHpW7h+
	zfVHP+pA==;
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zUe-000000011K7-3ecW
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 17:36:42 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-124a7216c9cso5560c88.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Apr 2026 10:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775064998; cv=none;
        d=google.com; s=arc-20240605;
        b=AIcwAZIIUDRwPYc112gsVQpoK++Uusw0s9mddC/tRA/3V1H+cFJTkfmALyOtwNwrRS
         GFWrrpsfEh4zAYFoK1gE3MgzrMwZOfYVUKH7CDbR+V8bLeTXbGyFhR/sXuYUeXeAst18
         ZQT90cp35uQqHHi5shBRYmsZ5/dq/un6vzU2Gh/8ut1dV409yDGf4yqkTTt42dMTj1nK
         KcF6/5qmK9Hn/FQvsxA0XkB8SgvjA4AK/c7Br3fDK1knaZMOqzjAwbydBBx2cfebtgen
         UIa/0UTWSY/I3UH77Otk7eJ9llM4YHz3bpZOjZkt5p1a8E8Bc35TcVak9ZvMzCK15cQl
         0oEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        fh=tL0sq/vPb4MnMSZOcGZfY3WL8QqEwtVJ++64AwSVk3g=;
        b=RAOJFm33dQK28qeKf+XUdf543+A8lMvGRdu1EHXw1DDOsdGy4Hf6bkluM4Mfad3hBl
         e5uQLZ4QB2wroCpBnG5JaUuZMrROe/uU4Uydtowe9kZgw+0FLLHkS5inX11u9k6TjX97
         cyX6SMy6wC2TAxTq5Yn5yJnROUR2QfYnr3Seono07HcnJzywYzY8V3QFec+jOFK0wL1v
         AoDV1W/7lsUaju26qzpeMck/fc4wm7OTOwS8yHM618FhpQx8imxiX24w4Vhg/zgeF/W8
         WfhQ0xSgb8+OhBmXxNj+qeDe3JiD8IegWL99l81cn1+rwJtmNRUa0vJzV22KXwIJoWTZ
         MzNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775064998; x=1775669798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=GkBCFewdTgEzJcAZ8RiLJvlTlOTXa/qqQgMztyQsMq64VdJBY4JSwtDq7Y60ow95MN
         2V2JggLro89vqIpn7oy4R47ZWXKIP9Zg5KdBGmA/F2/KsG8Kn2i93MSbgPIz29ddpyq2
         K4tPuXCJRnqIuYt2Kzwo9DwM2UYsvb6Td3mpWhX+vElyMk8PBsaSxUxY71y3wvLlBVzH
         AS4yVlVFmxjsEzc2EHNZieK5BhgJKHKZEYrAbOjztP9/GT4lg2ov4yOJNRstRUynLOmO
         K1jAwwx2I9G4cgdHyyQgBkVOqUUBWXp9dvcibI9Fk3FxK+JmK0z5PDQOZbfB4hSCpzot
         WcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064998; x=1775669798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=UfWmaQHnu0PP+92DC43LpuzhT3aAxvCYTxTUhDPvMKrhGAKOQk82KtlD8yosifuh0u
         UkhQv2SxJxq6nBKv9c0RikKW1W4SQN0TU21m1bGq2TXMi9IlCqDKT5C8Vn692lql144P
         TusM8UxDyDHaT63uh7Y0tUXJRjhju9+BjPruo843PNn2hZLtMF4DcNNNbksBZUs3JtKn
         FhOG1zIA8QkPnzjg9aQE8Ekn51K7EnIG9xM2IVfpx42nN4T6PQyKZhTtLmUiwQvH+wcl
         dfnTeCsz6RzhwghxpiQyLlyrnf99U3VXeMebCxuH3avXTyyZ/M157rXIIazt0SRLJFdF
         Y5LA==
X-Forwarded-Encrypted: i=1; AJvYcCVVOi8i8bg8sXZBF8WuoE9M8SP3fv5P0jxReT+cP/sAZzcT4XhUpvCdMzK6iLH3KTnlt/uwK7jfQkrISw==@lists.infradead.org
X-Gm-Message-State: AOJu0YylgoJ0/8tHqLXK2YfqqZTb0phwJjTH6X00UGJdLHzRntFgO7Fx
	8Gx6wcIr7Yaz2I+RmzagySzd0tERZouB2k9dnJknxejuJXqeYpm/K0da7beisw+5TLeUlvlP0rD
	J+CKdjhX1UwQQe+RJCKViR4SR1R3/Q2A=
X-Gm-Gg: ATEYQzwoBWWUaenZe+t+nkHtAq7xZlg5cTCA1FxLGMx0tSvFKK/RBmkhroVKJkzA3RB
	G4VpW+aSw2xciKBxYu4OvzzwYjfnRsKPOutTjsDoYMR/VCr0wIvWXvBRe0tMVivwftd9U0artH7
	y6DBK4c4m5svWYqc7hi4eGpVyntrhAuHMDHPp0/a5Sx+aeshMQreknIYTytiKCCXcEXhzelTKN4
	kOaifWWP29fL/yliQX5B841+F67M09LjZsRpsAgBE3YaJvnPNxfVn5gjvp3B92gsYwWFcPDdhMO
	b4d4pw6VJaEZVKsxfiiNqTmbZiPxmfmAUonRLxglOauzWYO+UtJu6fw/AKqj1+Jb2Zga8ul5GEx
	fZPzZ227qUHK25GkrYwc7jbA=
X-Received: by 2002:a05:693c:2c97:b0:2c7:2cac:8162 with SMTP id
 5a478bee46e88-2c9326aa500mr1010168eec.5.1775064998156; Wed, 01 Apr 2026
 10:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-9-ojeda@kernel.org>
 <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
In-Reply-To: <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:36:25 +0200
X-Gm-Features: AQROBzBeO_yfCUmMruxpBPrHPRt9Z-RBtWsQqT4MIRVUyc-eOkOj6bAx0WG8aNs
Message-ID: <CANiq72mnnro6UD3SYgTOG+kipwkTBvbEAGH+jXUa3kLTUNje2A@mail.gmail.com>
Subject: Re: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix` workaround
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_183641_011764_5B53B8FB 
X-CRM114-Status: GOOD (  18.09  )
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

T24gV2VkLCBBcHIgMSwgMjAyNiBhdCAzOjU54oCvUE0gR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5u
ZXQ+IHdyb3RlOgo+Cj4gSSdtIG5vdCBzdXJlIHRoYXQgSSBwYXJzZSB0aGlzLiBZb3UgZG8gcmVt
b3ZlIHRoZSBmaWx0ZXItb3V0IGNvbXBsZXRlbHkgYmVsb3c/CgooSSBzZWUgeW91IHNhdyB0aGUg
b3RoZXIgY29tbWl0KQoKPiBMb29rcyBsaWtlIHRoaXMgaXMgZ29pbmcgdG8gY29uZmxpY3Qgd2l0
aCBydXN0LWZpeGVzICh3aGljaCBhZGRzIHRoZQo+IC0tcmVtYXAtcGF0aC1zY29wZSkuIFBlcmhh
cHMgd29ydGggZG9pbmcgYSBiYWNrIG1lcmdlPwoKSXQgd291bGQgYmUgb25seSBhIGNvdXBsZSBs
aW5lcyBjb25mbGljdGluZywgc28gaXQgc2hvdWxkIGJlIGZpbmUuCgpIYXZpbmcgc2FpZCB0aGF0
LCB3aGVuIEkgd2FzIGRvaW5nIHRoaXMsIEkgd29uZGVyZWQgaWYgd2Ugc2hvdWxkIGV2ZW4KY29u
c2lkZXIga2VlcGluZyB0aGUgd29ya2Fyb3VuZC4gSW4gb3RoZXIgd29yZHMsIGxvY2FsbHkgZm9y
CmBydXN0LW5leHRgLCB0aGUgIm5vcm1hbCIgY29tbWl0IHdvdWxkIGJlIHRvIHJlbW92ZSB0aGUg
d29ya2Fyb3VuZAplbnRpcmVseSBiZWNhdXNlIHRoZXJlIHRoZSBmbGFnIGRvZXNuJ3QgZXhpc3Qg
dG8gYmVnaW4gd2l0aCAoaS5lLiB0aGUKd29ya2Fyb3VuZCBzaG91bGQgaGF2ZSBiZWVuIHJlbW92
ZWQgYmFjayB3aGVuIHRoZSByZXZlcnQgbGFuZGVkKS4KClRoZW4sIHdoZW4gY29uZmxpY3QgaGFw
cGVucyBpbiBsaW51eC1uZXh0LCB3ZSBjYW4ganVzdCBrZWVwIHRoZQphZGRpdGlvbiBvZiB0aGUg
ZmxhZyBmcm9tIHlvdXIgY29tbWl0IC0tIHRoZSByZXN0IGNhbiBzYXkgYXMtaXMsIGkuZS4Kbm8g
d29ya2Fyb3VuZCBuZWVkZWQsIGJlY2F1c2UgeW91IG9ubHkgZW5hYmxlIGJvdGggZmxhZ3MgaW4g
YSB2ZXJzaW9uCigxLjk1LjApIHdoZXJlIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZSB3b3JrYXJv
dW5kICh3aGljaCB3YXMgZm9yIDwKMS44Ny4wKS4KCkl0IGlzIGFsc28gd2h5IEkgYWRkZWQgdGhl
IHNlY29uZCBjb21taXQgaGVyZSwgaS5lLiB0aGUgIm1ha2UgaXQKY29uZGl0aW9uYWwiLCBiZWNh
dXNlIEkgd2FzIHRlc3RpbmcgdGhhdCBpbmRlZWQgd2UgZGlkbid0IG5lZWQgdGhlCndvcmthcm91
bmQgYW55bW9yZS4KClNvIGl0IG1heSBqdXN0IHNpbXBsZXIgdG8gZG8gdGhhdC4gV2hhdCBJIHRo
b3VnaHQgd2FzIHRoYXQgcGVyaGFwcyB0aGUKd29ya2Fyb3VuZCBpcyBnb29kIGV2ZW4gaWYgd2Ug
b3Vyc2VsdmVzIGRvbid0IHBhc3MgdGhlIGZsYWcsIGUuZy4Kc29tZW9uZSBlbHNlIG1heSBiZSBw
YXNzaW5nIGl0LiBCdXQgdGhlIGNoYW5jZXMgYXJlIHZlcnkgbG93LApyZXN0cmljdGVkIHRvIGEg
Y291cGxlIHZlcnNpb25zLCBhbmQgdGhlIGVycm9yIGlzIG9idmlvdXMgYW5kIGF0IGJ1aWxkCnRp
bWUgYW55d2F5LgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
