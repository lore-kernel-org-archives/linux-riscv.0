Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00977C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 17:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqS6iBcrqATKkafvEcTo2yPFhWQV0gP0pfGTjfr2U60=; b=uzuZtYu/ScNgku
	Opk7X/nli8ZhfFtTHWBfWBQuntHbnYyo8sXtT8+wa+4wzcve8OjpwzqEXq0LlSj+yn9yYRbY/Hb6B
	KepbBxNMfkxsDR0y/9SxmkRbNwKAINYs/g78s7zUpTJunitgsT17qo86l/iw7HF/rMkHbav85Cj/X
	yMTOocFw481ZIrVHck1Zm+1mtonyQ2hI3SJu4LF6yfOWslvc1w/awXBn0d3QlWdnLzaMwyGXHEoQE
	NPoKEgjQmrWrADZLRsPGbDCTnsP+3KeHWCZ87E++5CbllxZ0eooN2Mi9mLNjF+nMx/mJG0yBtcdD4
	iwkDvCOK44PMg9NuDUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNbx-00G2Sg-2P;
	Mon, 03 Apr 2023 17:04:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNbw-00G2SQ-2R
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Apr 2023 17:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YVyyKhZhVKFELaIeQcqrXX4LwNgdwjSlp3Qd8NQAQ4Y=; b=NCG+vJ+Uz3smQtYvOO4t2/qRsx
	Kbugjv45QctclgiRjhqvOfR8k/Ybn35mu9JVFL8VPYHBL3VjZ3YUSPAEqYNEb86CZTlN4F+5vzgqB
	+NDf58ilLI0MOe/sXGcLCkNMP/FY+QGdavNywfrf9WRZ+rZmx5cOjknWLs9GhnGWJdvkn9pXuCexW
	stLSty1h0y5JeI786bQqb7jIn4eC75zkc3JWFcSiSbs8EP+KCedlzf0lS+KnPb3l8Vz2epYbdSyKN
	93zssspR7Ht+Wi8+adyJWkO07ZZE91Zpt3UCblw1YBuLyPd5p4zbtVIX2YKG5LB2tGhpr15lR2OGN
	uNDwsSjg==;
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjN6s-008wIR-1d
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 16:32:48 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5491fa028adso65901037b3.10
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680539563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVyyKhZhVKFELaIeQcqrXX4LwNgdwjSlp3Qd8NQAQ4Y=;
        b=alovpYhaZ6LPgZSHYZtdkBDDP0URHuvySe8G9XIGLclC488EV1E3u8rlGcp9dZbnFJ
         /i8Lzo6P6svFjgqn96yjhxT0ADCbnoj2Px0Gowwg4kddCMBKZwm3AmjpfV+9Gkh1WaV3
         Z97HoGa5/whNh0FKrEWHg/Svs0YwBmikaDdmu7JOj1JqIRkjxiafRgY58IWwyeOxGfHk
         qxn0OLjqQ1rLbUhR6XiXIjMbK3SGCGFnx64x3b0ilnbiCCWmir8GsI6733wJ47xX31MP
         8LOYK1RonB8ftVBLCb7+O1MaQS79d0rkBJUTkpeJKXOg2rDoN4sEoZgmxBq1BSBKjYCH
         gitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680539563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVyyKhZhVKFELaIeQcqrXX4LwNgdwjSlp3Qd8NQAQ4Y=;
        b=RmCNXAH3NYWx7fdc0wqv/qJlcd8LynfVpvJd1cKF2vmrm1KlKYfOC17c8IkbL2V9Cv
         dpQgXMkCfblJA3fMDLrlEZjOUzpjrH9zeq6tNE4h7m/jqGlHXzqzzhWGQkJpraViM2jw
         z4913Qfurw5pAN4UppOCkW45ox6kSwS+o/et+GPvMhWhrLZgHpxWg80xzcH1zeg7e/7g
         p3W9QGzAbXHoRjeGakr85tiSws7gLxYxy208QqJ0hXWc4i9yUcw8X3WFHuml5y17Q591
         Q7s8Kd2/Rw8EqYj2hUP8KUqYenrJKqgKxKjxw1hRFqlQog8zg6ZyOQTImSuXbLPb69FY
         O4tQ==
X-Gm-Message-State: AAQBX9eG3Fl2f6naQvnJojKzS/efJAofp863qCFbsnM2UM9m0AeTmIqI
	DN1aSOqIeb8obwhTPFExxXJsot64LbGzk6kqrAk=
X-Google-Smtp-Source: AKy350aADD43LM+6Fyr445lMNk19yeKF5hWPrYO4YfT7Tju/V/ectKNIFIvehRrqfUvXOPFrQuLZ31r3hVYGzRsmpTo=
X-Received: by 2002:a81:ac46:0:b0:533:8f19:4576 with SMTP id
 z6-20020a81ac46000000b005338f194576mr18159721ywj.0.1680539562651; Mon, 03 Apr
 2023 09:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com> <a6220e52-9934-422b-9b05-95705b8fd684@spud>
In-Reply-To: <a6220e52-9934-422b-9b05-95705b8fd684@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Apr 2023 18:32:31 +0200
Message-ID: <CANiq72=FN3zB-gajQYDxXmnmx7J0UNstFuexSCOg8Oe2fnG=yw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_173246_732139_B673DF18 
X-CRM114-Status: UNSURE (   6.73  )
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

T24gVGh1LCBNYXIgMzAsIDIwMjMgYXQgMTA6MjTigK9BTSBDb25vciBEb29sZXkKPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IEF5ZSwgYnV0IHRoYXQgZG9lcyBub3QgbWVh
biB0aGF0IEkgYW0gZW50aXRsZWQgdG8gYWRkIHNvbWVvbmUgZWxzZSdzIQoKWWVhaCwgZGVmaW5p
dGVseSEgSSBtZWFudCB0aGF0LCBmcm9tIHdoYXQgeW91IHNhaWQsIGl0IHNvdW5kZWQgbGlrZQph
ZGRpbmcgdGhlIGBDby1kZXZlbG9wZWQtYnlgIHdhcyBPSyB3aXRob3V0IHRoZSBvdGhlciAoaS5l
LiBkdWUgdG8gdGhlCiJ0b28iIGluIHlvdXIgc2VudGVuY2UpLgoKQ2hlZXJzLApNaWd1ZWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
