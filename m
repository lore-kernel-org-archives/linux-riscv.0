Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E36CCFD316
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 03:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUmTZ1OQAS5uoXJvGXfDU17ufDAGUIdRgmwaVYtgVvg=; b=n8eoqRSHaUNT/P
	Az/Ijz/G4Jz0AP/2cqYedwJWbPQuLMFh64/sfWJIH0bnQk8SBdyGSzu9oTVa++sg48eBfY6Fk4C0S
	zrcQnp/fNHA2IfMlbXZBe6kxQkmC3WXcBbuDmvTODMavALFQzeLbL2TFRmnWVM9Du+Shicajwq1b6
	q/G568bEpy6iSyuLoUPbK3+q1wgJYVRpTRoFfDhlsEVWEgruzl7O7PiVsZ21swWJaZ+rqh1hFncVr
	Lgn34vf5Py9761uMmO+4gZzhGZrnAKijq0oBJTyuBFoyelJkNZaRmCcxnXNNmjbx+xna1bXHL4l/H
	wbo3efnhg2wabmnRJe2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNMwe-0000000B1DG-0BLo;
	Mon, 24 Nov 2025 03:08:52 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNMwb-0000000B1CT-11XA
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 03:08:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29806bd4776so5462425ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 19:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763953728; x=1764558528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
        b=BtEFFFKncOEvI04mOruLv6c2ZdBRcpSkjmc16l8QTFzx0pHTwX+jcgDfMW2kDQplI0
         eyvUBEO7WY7ibYDrjVf1v2+acGDsyBlbghT8HP4OSoFWEh/x3MZJmiTUhE1S1UF36EWT
         14Q53314Ngdd7xJ5dT+ehXY/cbFdYDSKDvOEkq9dQ47BtHGRtD1jfGfEAWjmv1qOWWKZ
         GhsQL5aJn15DldMfZ9CILHwLKKZfIwG1JZludh1IkfPXQU1ZFa1kplqbYk16WZWNziXb
         GewhbfOh0fR5CEHfEvLnNNQPi0O+wABYv2FWSK5BR6+3hQcVV+XfsSfbT8lQXHBV+LFS
         6ZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763953728; x=1764558528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
        b=xTMOF+HkQce8iExEwkG/UsxG8duJn6rXIaX0eFLnwNOu8dV9I1VpNsC2eMhM1VBNLO
         F2Xx1TkUXo/OuzMXy8hCiIlES+yrhhzsUYZPZo2vUCZIaLPWOQgNOLU8CeWiW3YiGQYI
         w6Ncn0zRLQUWHMHwxcjJ6PqJZiA7i3jWg26AddEEM8/+Gvq/iL1hnDmePbssBH9aZjyf
         HZNZ53MqFEqRnLjXB7CIEOeNz4NpcJ0gbYa5hPEoKKDa4oFy/kI9ZUKH4PUQpMVjj/nj
         dPxlcAxVU5S46ZWsReLq9iIvG57xA4TziTXwgBtZzF5LInYKjqc+nClGVBWlPsK6oAMs
         5FnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6ZeJyzbw5RUiQ2XdvUemVA2K6eIj99kFF3i11L3PhP7dhiLgvk/T6zx+CDlTdFk37/zbmHTbkpZuxdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGD0Z/7EUd0XYT5t+WukeR3Lv5Ke4Eqmaku3j4iLTfAaZPBGCq
	qiQ+IXF6iJmPjwz2OXDlnoRqYKE6qPxhZ3x8ql8lqPvnU2cIoGoqw7X6hRHkyWJgJ1jECqZlY30
	0eTVZxvqKKcKp197YzcW2tEqiTcwh8Rk=
X-Gm-Gg: ASbGncuFgCZZDNaUxzfUXsOz1leT5fF1GRoMmaQv92HnZCp5C/pXKhaVpwljbZMMcmY
	CJF1IBlA9Sn7uJxOb3You/Aar3cYxLDL6W0mg+Uggc5skG13aHX3vGFzPoo0wSQhSxsNjIZEKzm
	jdhRcfXu2GLCNQT/Dddh58ZfWeDX4yKdeq5xMUdGygIjxvE7oAKbqn10s82VTuONlyieaN17BHK
	EkovJFd0j232tubfKv+0GSEr06hy1ZCIGK4abJETujGopeEWteN8PFICJb4B+ll/XWjZvmjl9U1
	d3MQhmHAN/tdbTbGkjkL+RI/LRubtK2XXjEuD4tz0MryFcphrz2GPV05z9JbKzoHvsJ6RXWoXfw
	Hz/EYrXm1Bo+ggw==
X-Google-Smtp-Source: AGHT+IHODcnccPs9iRgVIOwlcuA2DDRG3ls89WHmZSy8djjz85e63ugOsI0kgj+n0Sr7cHyi8QYJvH0K9Tj0s1pUI8E=
X-Received: by 2002:a05:7300:dc93:b0:2a6:9dbf:bbe1 with SMTP id
 5a478bee46e88-2a719324a83mr5922485eec.3.1763953728292; Sun, 23 Nov 2025
 19:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com> <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
 <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
In-Reply-To: <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 04:08:36 +0100
X-Gm-Features: AWmQ_blIu7x6QT0VZIH89GBJq9q0tlaW_UfH33KPy6C0uRHf1k8ZydlwBKRhGvI
Message-ID: <CANiq72nDpBodFh5Zqy2p9jwWyfAiY6KcEEyugHeMDEmOR6Rogw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_190849_286872_63CB54E4 
X-CRM114-Status: UNSURE (   9.48  )
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

T24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgMzo0MuKAr0FNIEFzdW5hIFlhbmcgPHNwcml0ZW92b0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSSB3aWxsIHNlcGFyYXRlIHRoZW0gaW50byB0d28gZnVuY3Rp
b25zIGluIHRoZSBuZXh0IHJldmlzaW9uLAo+IGBiaW5kZ2VuLW9wdGlvbmAgYW5kIGBiaW5kZ2Vu
LWJhY2tlbmQtb3B0aW9uYCAob3IgYGJpbmRnZW4tY2Mtb3B0aW9uYD8KPiBXaGljaCBvbmUgZG8g
eW91IHByZWZlcj8pLgoKSWYgd2UgZG9uJ3QgbmVlZCBgYmluZGdlbi1vcHRpb25gICh0aGUgbm9y
bWFsIG9uZSBJIG1lYW4pIHNvIGZhciwKcGVyaGFwcyB3ZSBzaG91bGQgc2tpcCBpdC4gT24gdGhl
IG90aGVyIGhhbmQsIGBydXN0Yy1vcHRpb24teW5gIGlzCnRoZXJlIGFuZCBpcyBub3QgdXNlZCBl
aXRoZXIgKGl0IHdhcyBhZGRlZCBmb3IgY29uc2lzdGVuY3kpLiBVcCB0byB0aGUKS2J1aWxkIHRl
YW0sIEkgZ3Vlc3MuCgpBcyBmb3IgdGhlIG5hbWUsIG5vIHN0cm9uZyBwcmVmZXJlbmNlLiBgYmlu
ZGdlbi1iYWNrZW5kLW9wdGlvbmAgc291bmRzCmdvb2QsIGJ1dCBgYmluZGdlbi1jYy1vcHRpb25g
IGlzIG1vcmUgY29uc2lzdGVudCB3aXRoIGBjYy1vcHRpb25gIGFuZApwcm9iYWJseSBlYXNpZXIg
dG8gdW5kZXJzdGFuZCBmb3IgcGVvcGxlIG5ldyB0byBgYmluZGdlbmAsIGFuZCBhbnl3YXkKdGhl
IGZsYWdzIHdlIHBhc3MgdGhlcmUgd291bGRuJ3QgbWFrZSBzZW5zZSBpZiB0aGUgYmFja2VuZCBp
cyBub3QgYSBDCmNvbXBpbGVyLgoKVGhhbmtzIQoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
