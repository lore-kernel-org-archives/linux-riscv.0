Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648C9D1CDD0
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 10:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNhihouv7JbNDc+1YZkxmlhrfdrXubjO/5KLZFjbQnY=; b=pgTnyxViiDhkYx
	gnNVry3alo1XDLXEYYsRglnj4RH75Np02FG5/jKGxquzDJ7+6lbYkmaMcy6sFMePT1zq24ALiJ3Kx
	p1wJ8VUUrFGlYI400lrsMpQlPpzWaP/x6U301fWFZj6fQO06SKxNdunQRKnu4DaluYi9vBiCHW88q
	szvAcaEbpBwR7FTjc1b5kPjJkdrMr17NDm5MlnJsKefs6EntiTZaUgiMuAOkD37KimA223BEIdINN
	Yz3iY56dL69w8QCAsUBObBI+r0RUnz4mYlaeYmmY6EUELNJw95mOLAtylPqDz/77qAqIjCaTa68vG
	5VaeJixlwpn28DVfHRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BuB-0000000AUZT-0iaa;
	Tue, 22 Oct 2024 10:14:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BXv-0000000AQom-2Rhg
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 09:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729590681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHDMCQSj4bOSnFGm64uWhd8NfaqRwIffME40ECj3VBk=;
	b=Ol0IgCoGl79EZxZ+qLnTwDURK4Y4/nEohaTAjgYOJWSxLYKPGlI+Xmahp2W5pBVhPz18Uw
	nz8kpQFmJCRtY4eiPEgT7t31WtYop/+NujHUi/kzX/K19/PwsSmv5PMNyK6iAp/9E9DBz3
	o2jLHbLP5Wt2AfNWTILN/Jfme8Datr8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-yrjpfnlOPJ6Q-kPIj1HzCA-1; Tue, 22 Oct 2024 05:49:53 -0400
X-MC-Unique: yrjpfnlOPJ6Q-kPIj1HzCA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d49887a2cso3010375f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 02:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590592; x=1730195392;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FHDMCQSj4bOSnFGm64uWhd8NfaqRwIffME40ECj3VBk=;
        b=dIUFRwbqxkfqJinKhK//x4wUAdepIEFyB1VJ0anAjkYf/O2YwY5kB2cDCXB1dotGoe
         kl5XbEW1I7ptCQcuxY7JsFqnS5PH9NZiGWtDJ+BafuQNJv7rSJGGgs/gIP2EcPEv5yYO
         Cs5luiCpFdYxr6KhX3N3tAwI8+sTlyk04Y9KmbTRCoFyytJJYlKuikO4ab++igCOlEr8
         pp08urvg8NyMFuA6R578KbYRGdvBC69JBARZqIzB1j5jTXYeyAtcCzJczuMr1rmKl6uj
         ftdAYsvg5p1bMqTrPLgHHL/OlsONazdpehOHon2M6PYbWiWPSR9YPIb7Gvc7u5BLRBuN
         SJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWboiM+cDV0jFouOCp/DsH+vcK+ljo7z5O2/QgKPJrOnIYrPL/okefvJCH041e+nS0VaBjm6upST5OsCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNOg7vB6+AdfHOnJZTpYwuK1RolbB3THtW+CZdpFzKMNQpWMsx
	j5wcQF9mDcdyPSPzxQcWmef+sNakfggUYtPYVUsNJPB5qmQt6cPQYh0c9a0Mhr46U3XI110hsYu
	5QjOptijlFN2njVrrH8wslAGDPaQl1krzcfPFe8z8JtkXTyUyGBoWMpsYA6s6L8xtvw==
X-Received: by 2002:adf:b186:0:b0:376:dbb5:10c2 with SMTP id ffacd0b85a97d-37ef13cd752mr1751571f8f.29.1729590592136;
        Tue, 22 Oct 2024 02:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIEHKao3U/XFI7bzq9Kj6t6RyZxy0cnLw5nrYDT+Cbr6tQg8AZS6TySYFQBcdNzKRVWndUxQ==
X-Received: by 2002:adf:b186:0:b0:376:dbb5:10c2 with SMTP id ffacd0b85a97d-37ef13cd752mr1751544f8f.29.1729590591777;
        Tue, 22 Oct 2024 02:49:51 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bcc8sm6205364f8f.107.2024.10.22.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:49:51 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 84B08160B2CF; Tue, 22 Oct 2024 11:49:50 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Puranjay Mohan <puranjay@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>,
 bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, "David S.
 Miller" <davem@davemloft.net>, Eduard Zingerman <eddyz87@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Hao Luo <haoluo@google.com>, Helge Deller
 <deller@gmx.de>, Jakub Kicinski <kuba@kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Jiri Olsa <jolsa@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, Martin KaFai Lau <martin.lau@linux.dev>,
 Mykola Lysenko <mykolal@fb.com>, netdev@vger.kernel.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Puranjay Mohan <puranjay12@gmail.com>,
 Puranjay Mohan <puranjay@kernel.org>, Shuah Khan <shuah@kernel.org>, Song
 Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Yonghong Song
 <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next 1/5] net: checksum: move from32to16() to
 generic header
In-Reply-To: <20241021122112.101513-2-puranjay@kernel.org>
References: <20241021122112.101513-1-puranjay@kernel.org>
 <20241021122112.101513-2-puranjay@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 22 Oct 2024 11:49:50 +0200
Message-ID: <877ca0ii0x.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_025123_713839_181C37DC 
X-CRM114-Status: UNSURE (   7.85  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gZnJvbTMydG8x
NigpIGlzIHVzZWQgYnkgbGliL2NoZWNrc3VtLmMgYW5kIGFsc28gYnkKPiBhcmNoL3BhcmlzYy9s
aWIvY2hlY2tzdW0uYy4gVGhlIG5leHQgcGF0Y2ggd2lsbCB1c2UgaXQgaW4gdGhlCj4gYnBmX2Nz
dW1fZGlmZiBoZWxwZXIuCj4KPiBNb3ZlIGZyb20zMnRvMTYoKSB0byB0aGUgaW5jbHVkZS9uZXQv
Y2hlY2tzdW0uaCBhcyBjc3VtX2Zyb20zMnRvMTYoKSBhbmQKPiByZW1vdmUgb3RoZXIgaW1wbGVt
ZW50YXRpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtl
cm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJl
ZGhhdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
