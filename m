Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2099CCCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 12:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m70QWtlSGxTB3jFaRpe20PM6hGg/MM2CFCVdKSm+83E=; b=xsiWP07QXkXQtx
	mF57ZreROip1X065e4c/+ycaXnEWto5NQmnnPKhwU1RacNkKHlfzdLIsYGzFA9cUz8GFnv2G4TWiE
	v56Odk3hTyoNseDdYnw40QqL++buJdHPtwc4hmUOPll+S7m2C/ODrt8SbhwjbC2tNtIBxavyHedBY
	A5YcPIK7SFkCsu+w5bD6ixfPHjjywERvdc/JJSzn9NqvaCnAI5BIME+xO2H4XRs+RfynNz4WUOZl4
	LhH0z82d6BgbM3wsaOEJe85s3VVFacOhIGulg2+c4J2QYbilytk1EPY2HJgJbr7DOScvnEmWyGYcH
	OEAdyvEEzeeDf6g6HumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEogv-000000068HE-3iNu;
	Fri, 31 Oct 2025 12:57:18 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEogt-000000068EJ-0YNv
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 12:57:16 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso332483a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761915434; x=1762520234; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57XM95AelX9DUBLfU9THwVSSutS8OZT8Oj+HWgG7Ons=;
        b=d/A9xZxjFXiO5cU21PJAUff25i9/i19HpFF73zz2Wpjh1cvOxuxeEv4MoSEZuquk+d
         jjfgR4dXHJzzrdS8v2EXc78gHNnAZsF5vJyxUM6B5Nm33iLb9E/yW74CIEMSzBK5Qpmt
         NcqOg9SaDJNkm+Z3vBXGZ/FEO0GoRhv70ksm+/79LAZLv5MsvF3FA+n/QTAdesupJc1k
         Fq3m4YMBgFs7UsC3p8ptBEp7wFbyIyo9q6GeFtIxwJ2w4mq/6aNm8tgdRh1mEZ1C7skG
         NqDFkJHPXdb7/UYGpc76tWFEfvDgZJG7Kk9Gy5iscsa2Cd72ay3AeRr4sRF0sQX9aFlo
         +Rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915434; x=1762520234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57XM95AelX9DUBLfU9THwVSSutS8OZT8Oj+HWgG7Ons=;
        b=EJ7sHA7jD8YErx9XGeqz5Zaq3FrR5O9IjajqGMyUJ+fWuUIVDa90goB617xaRglTOn
         NZ1pXuv92jXZCxJQz+jgGC5ZxCEBz68LtJIam9bqD3rBC2L4+5e+ruoJXAylQOeplYfp
         u/Ir+5lVlB4At6ALj4JcAQlN0nDH7cYNtDFmBJZZo5YoxEx1I4AWD2A7z5Ufa9pGSmLM
         gNdviEWJNFwNOsNQvb6CocN33QgtSRFMXixxCMrAfjiw5NiBSy6US5n7a6MCHe2X1cSu
         /EpnIsiOag9rUl4DYu7GfR1+Ht4OjHax+lFew1HSV5kvgucxp1ZnoTqCvPn/K6Ue/tt7
         CdGA==
X-Forwarded-Encrypted: i=1; AJvYcCWILLy5qeGnhCvkeY+Q9tpUyTZNlxJ0HI+e1KHez/7MdunKl5/iMwZTHJ6NRhKPJsrzXH3zB236Ky734Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoPYDvj4H4sNCXW6npgna7kvR1BOe8y2e4Kv2mX7xg7LsHmkoP
	rtrrySrFviiRUr/6Ev8WZIM7CXaCIhFE6JrbuwcCtIy8I0YK6lLMN96gNXGL5c+2Bd4BSsbWFPg
	ixVu9HY5xD2cDSe0Kthcx6OrgtJsxa6s=
X-Gm-Gg: ASbGncvSQHG/vIhjPI8qGUuWZqfomUHJbYm5mZo+k9tuUrIIbFaNSG+QQLhl634FE5q
	fDwf9ChEtngDM5hmoB+Vw4YM3UxB+2XGExkux5fer4jPzptaIhWqt86Jj79UUXT8NjFGp8TPPXZ
	Sr/zmkhgpRFcm/xdHy//SX5QAjzUvSMcJ71KOkd6gZO+XtWoHgbHrHwWtBsesL38KkdlYqe+PDk
	jxPLstd+1Bo08L752mWMuqELsh4t3sUSYsjllQcNi4cjtOvpILWWdbGyINA7b4Mi7s2dTbfVd7z
	fQ4diZuZlBNcBC6F3LHljHsffHLIO1E58Ao1i4ez4OZ4jabZHSoBNzWRolbsm0j9s/iH9ef5RuT
	8oaDQ43btyiFwYQ==
X-Google-Smtp-Source: AGHT+IFJM+PQMbTXmTGodnAosPHILr2GU6NSMb59LbmXplfAnvliIPhU9LCa4gpUD72tPa8WjMFa+1grBXZZatyQfa0=
X-Received: by 2002:a17:902:e887:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-2951a3d2847mr26244955ad.4.1761915433746; Fri, 31 Oct 2025
 05:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a@eucas1p2.samsung.com>
 <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com> <h3sivr3uuzr5oodqe326svchbw3rzo4f4nw4chpeee2jwzjq3j@bdtecauehkn4>
In-Reply-To: <h3sivr3uuzr5oodqe326svchbw3rzo4f4nw4chpeee2jwzjq3j@bdtecauehkn4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Oct 2025 13:57:00 +0100
X-Gm-Features: AWmQ_blGoLkmXXueKnCk5kJ5O9pXLS5GlmxYneYVuP4K75NG97cEfvhzpNZh5XM
Message-ID: <CANiq72nNxVJeMZdESrrB+LGmdRK+M5AGZbUw-x2aE-Qa-=HtJQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: macros: Add support for 'imports_ns' to module!
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-modules@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055715_192727_6E659E42 
X-CRM114-Status: GOOD (  11.82  )
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

T24gRnJpLCBPY3QgMzEsIDIwMjUgYXQgODo0N+KAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xl
aW5la0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IEkgYWxyZWFkeSBhc2tlZCB0aGlzIGluIHJlcGx5
IHRvIHRoZSBjb3ZlciBsZXR0ZXIsIGJ1dCB0aGUgcXVlc3Rpb24gd2FzCj4gbG9zdCBvbiB0aGUg
d2F5IChubyBvZmZlbnNlISksIHNvIEknbSBhc2tpbmcgYWdhaW4uIEFzIGl0IG9ubHkgcmVhbGx5
Cj4gYWZmZWN0cyB0aGlzIHBhdGNoLCBJJ20gZG9pbmcgdGhhdCBoZXJlOgo+Cj4gQ2FuIEkgaGF2
ZSBzb21lIGJsZXNzaW5nIHRvIHRha2UgdGhpcyBwYXRjaCB2aWEgbXkgcHdtIHRyZWU/IFdvdWxk
IHlvdQo+IHByZWZlciBhIHRhZyB0byBhbHNvIG1lcmdlIGl0IGludG8geW91ciB0cmVlPyBUaGVu
IEkgd291bGQgYXBwbHkgaXQgb24KPiB0b3Agb2YgNi4xOC1yYzEgYW5kIHByb3ZpZGUgYSB0YWcg
Zm9yIHlvdSB0byBtZXJnZS4KClNvdW5kcyBmaW5lIHRvIG1lLCBidXQgSSBhbSBDYydpbmcgdGhl
IG1vZHVsZXMgbWFpbnRhaW5lcnMgc2luY2UgdGhleQp3ZXJlIG5vdCwganVzdCBpbiBjYXNlOgoK
QWNrZWQtYnk6IE1pZ3VlbCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4KCkkgdGhpbmsgd2UgZG9u
J3QgbmVlZCB0aGUgdGFnL21lcmdlLCB1bmxlc3Mgc29tZW9uZSBlbHNlIGlzIGxvb2tpbmcgdG8K
dXNlIHRoaXMgKGlzIHRoZXJlIHN1Y2ggYSB1c2VyPyBJIG1heSBoYXZlIG1pc3NlZCBpdCkuCgpU
aGFua3MhCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
