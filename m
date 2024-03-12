Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876FAC5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 02:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wwz7hdEgZCzQ4sQr6gFOXWCqVOBqM8dxkQZiDiWRxEc=; b=zqhqzzbnzo7QrO
	MpZNL6KlMVCmOdXgOUswucr+jhHMZmYYoKk9cmRxlMhTEEK1eoAu8MooBkMa5+uLwCvJuetY12lRP
	pjf1jQtMuHmg+10QWTFS7B0yUbx3Gw20npWTOkRvg05loioaHO38pwH2u+6MZuD4vDVKp7AN0LVfC
	MI6CFQNBjgrMDB3wbOqjQG/pwRNtO2gPetZWfmjQPVzDHbJjfLuSQsCx8wL9lWWa7a1Xzo/CnHxXK
	a8QYg2jvzzZCYj3lVbMYt3km3J83dH7knmp7BUhQkfdAlikRakDhI64xrNutp9acdOU1vszOJrcDl
	yyFLvY9DQRCNm5OBbuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrdp-00000003y0O-1g6C;
	Tue, 12 Mar 2024 02:13:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrdl-00000003xyd-4BAN;
	Tue, 12 Mar 2024 02:13:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33e76d653b5so3631371f8f.3;
        Mon, 11 Mar 2024 19:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710209596; x=1710814396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxgkr5eNkvW5q1zkcYlUGp+GjUJ5hPdmOjnvJkUucnk=;
        b=VAJv1pD89Sj9slWzV4JLFOQCBypqV78O7wJZQKzeqka+2iz/UXzK4TAWP6zVRvu4UB
         jdhhFGq/+gIjTqYA3XpTlK2EtJ/meyL5h0igQsA69MfOEAaId9gdYScUDonQ+782O9+E
         8xXDfH6ytdvc7RrdfGBC3Q87UIWz/QLCAHtEVS+yNn5iAks10Qgayk5QTfjf6TLbT7Pq
         6taIuwvKRd2eIBHuZ64FOSe86NmN/PjuSZCalvIqsiKAzNlDDkhwC9+HhJs7KXDtGzg9
         x4RF76wvpvyhQEyo+MP9CwvYWu06ORekf0kyW3mkNWv6ZsgS/8a2dVQ1I0mOG+feO3+j
         nerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710209596; x=1710814396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxgkr5eNkvW5q1zkcYlUGp+GjUJ5hPdmOjnvJkUucnk=;
        b=GEhZoQ3GacrzzEkk7P2mAlhxxcedoy59hPexy5baeK7Lyrl9/zRPWvl1gRd1CwOIL9
         ERLq4f9OqolLdFzDSfyydZjibx4HTCQK4BXr5lXG29wJceSrzfGuE3nQMbMfIbBUbeE2
         P5OnVr+vSbew/XbufaX6CBG1ERtczXvz+zmY3AVnUqdfE7IQkMyYjtLNSSVAzp7xLeky
         ocsW2Lq29SHLIpZ1QteExtjkQspn4ffAeiLL0Y0xkH1XpZQDBRou6AGfth+k6jecMNhz
         f0jTHXS4dJbawcuhzJteoAJKf2m3nCJeAvCRGYp5blS3BpLh7gsWRC8AH8JRf7T4b9XQ
         cg+g==
X-Forwarded-Encrypted: i=1; AJvYcCVAfp6AJ3Wi5eQ8CM9zLSecj/y1qvWv06c/ns00H3NCf7z30YlHrYfGdpTYillkc84gXPvwGoylraMNFRDV4bMOt5AEz2d2QfdgHZxTy5Xw5z4foE46VOssP9vK/aV+zlT4u0ioBaNRkkT/lYtVelkVbGpy1QU=
X-Gm-Message-State: AOJu0YwFQSXTyt1uBH7z/hkkHmiO9k6paSkXvHnBnSASj/qZmm7Tr/XT
	+RcPdvyUOAoWyqe5Z4JqJsregJ4Be1e1W8/uOkD5HxYGI7di63/ZUuiZpDTOAmrJM+uXxGzikm6
	iBWJf26DtFnj5suRXV2V+3UXWjM8=
X-Google-Smtp-Source: AGHT+IGaeIqJnZOJ/SuZRPtu+8MtD/3nozajQZ94fUgHlD7gwqeVkMLfFrTcgwoFQp9lHB+TsWg3BU+ivdAF6tyjFJM=
X-Received: by 2002:a5d:4112:0:b0:33e:74c6:bcb2 with SMTP id
 l18-20020a5d4112000000b0033e74c6bcb2mr5165378wrp.16.1710209596408; Mon, 11
 Mar 2024 19:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-8-dongmenglong.8@bytedance.com> <CAADnVQK4tdefa3s=sim69Sc+ztd-hHohPEDXaUNVTU-mLNYUiw@mail.gmail.com>
 <CALz3k9iabeOwHSrPb9mkfCuOebanh3+bAfi7xh3kBBN0DzHC3A@mail.gmail.com>
In-Reply-To: <CALz3k9iabeOwHSrPb9mkfCuOebanh3+bAfi7xh3kBBN0DzHC3A@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 19:13:05 -0700
Message-ID: <CAADnVQKsrLB-2bD53R4ZdzUVdx1aqkgom1rzGCGKK0M3Uc+csQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 7/9] libbpf: don't free btf if
 program of multi-link tracing existing
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet <quentin@isovalent.com>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_191318_080576_A0B87664 
X-CRM114-Status: GOOD (  14.08  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgNzowNeKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiA+ID4KPiA+ID4gK0xJQkJQRl9BUEkgdm9pZCBi
cGZfb2JqZWN0X19mcmVlX2J0ZnMoc3RydWN0IGJwZl9vYmplY3QgKm9iaik7Cj4gPiA+ICsKPiA+
Cj4gPiBJdCBzaG91bGRuJ3QgYmUgZXhwb3J0ZWQuCj4gPiBsaWJicGYgc2hvdWxkIGNsZWFuIGl0
IHVwIHdoZW4gYnBmX29iamVjdCBpcyBmcmVlZC4KPgo+IFllcywgbGliYnBmIHdpbGwgY2xlYW4g
dXAgdGhlIGJ0ZnMgd2hlbiBicGZfb2JqZWN0IGlzIGZyZWVkIGluCj4gdGhpcyBjb21taXQuIEFu
ZCBJJ20gdHJ5aW5nIHRvIG9mZmVyIGEgd2F5IHRvIGVhcmx5IGZyZWUgdGhlIGJ0ZnMKPiBieSB0
aGUgdXNlcnMgbWFudWFsIHRvIHJlZHVjZSB0aGUgbWVtb3J5IHVzYWdlLiBPciwgdGhlCj4gYnRm
cyB0aGF0IHdlIG9wZW5lZCB3aWxsIGtlZXAgZXhpc3RpbmcgdW50aWwgd2UgY2xvc2UgdGhlCj4g
YnBmX29iamVjdC4KPgo+IFRoaXMgaXMgb3B0aW9uYWwsIEkgY2FuIHJlbW92ZSBpdCBpZiB5b3Ug
cHJlZmVyLgoKTGV0J3Mgbm90IGV4dGVuZCBsaWJicGYgYXBpIHVubGVzcyB3ZSByZWFsbHkgbmVl
ZCB0by4KYnBmX3Byb2dyYW1fX2F0dGFjaF90cmFjZV9tdWx0aV9vcHRzKCkgYW5kCipza2VsKl9f
YXR0YWNoKCkgY2FuIHByb2JhYmx5IGZyZWUgdGhlbS4KSSBkb24ndCBzZWUgYSB1c2UgY2FzZSB3
aGVyZSB5b3UnZCB3YW50IHRvIGtlZXAgdGhlbSBhZnRlcndhcmRzLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
