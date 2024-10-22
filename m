Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B4DD1CDD2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Wicp6aXQuiPGr3OJ71kXTvkvOB/DC8GXXJxW70ZoUU=; b=qgd0ohYpTzltnq
	JDFndRxjlcRnZjNmWUW4yArjp+/KbUUAjoocPrtWyRZsIzbYqCr5oNucfFIyEOCOE0OtkVYtV+k+U
	iBCJuHVdkIpahAMnSybT1+ISKYcDFtorREczm63Vbdihiwf8gOXt5yn1LbAaQF2HndsotcncfQS8c
	nJ2ZiQ3iiLp3oRjzQ43fXSxVs9TRZ/42g5VzNPLBLkUsrWer+sMmshDFS2DQNLn28wObz5GCuvUTY
	ztAeBJ7Bi9vzmLdNCEYNo5cS8hOas5y8idX9wQdkh33b8JRlr6UZdEQXM0F51lAWR53Zbrim0AaTK
	GAsauHRdOS5P2ISuDr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Bvg-0000000AUsb-2YY0;
	Tue, 22 Oct 2024 10:15:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Bc4-0000000ARcs-1yM6
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 09:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729590939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ib0DWrahXU+UyLhjJUyjqhEX8gbxfkcMrsQFOh4hUoo=;
	b=RoFcTnXcC56nVaVCLxso86YAILj+6zVv/OovnqQCk4Th53qhJMT59UVGTnZnF4NhvGQ80G
	I+4Vm/OJ3Nws9luv3B2na4IUJnCWDsEcp/7iZ7ajCPFJAlxlwCC6Ny+BIhWI0m1D8V2bm4
	j9zCZkJki4Ic1EH6MaPNLV2IN1sox0g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-522uZOIcMeWvNt93VKUvXg-1; Tue, 22 Oct 2024 05:55:34 -0400
X-MC-Unique: 522uZOIcMeWvNt93VKUvXg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4316ac69e6dso23039975e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 02:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590933; x=1730195733;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ib0DWrahXU+UyLhjJUyjqhEX8gbxfkcMrsQFOh4hUoo=;
        b=P2Sdkatywz6PTPkv7EDm4vIKmCl61OhtwocZB+N9VRV4es0lod+kJrd+G/MY9xF0ks
         sYewqP6++wpMI1EcQHWzKilvU2EER9obCQyEAQ3QVCA1WKcj1fkTX1Jy64Tjfp1xJPZ5
         qzVmSAaBISMQ8lazDuF4F9jM+vkoFk2s5acKtnUUhv+TFptMSmr0GwSSagTO4OOBlccD
         4PpO5138J3cwTlfoplJYVL1aLj6ufo8Jgp5oM0ti6aFhjeF1oTGEolGoDhoAIkNyfv5S
         JCguwA2wH3xWtu90rl9xhhDw6IumRi5UApAwZMWFbpJMcS8K4hxAC+iG96TEnUjRibGt
         qbkg==
X-Forwarded-Encrypted: i=1; AJvYcCV63GkZQchXO3glOQj1DBzsBL+hdMLKzI1nME6IRYFYR5n160S/rhyk4m9zeMMmY8SuS2aw8rwmlYKk6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyngBLBW0fyK8+CrAkmmecAqs35lKm9bsNQASzUQnfly6x24tWG
	9Okv4cqX4KulHbCifFMuplpkZH0ISvwsxhDbnD+V0A0KwKZlhvAGVjvHXXXvwPfD2eNYzzkBWx1
	R8MzVFKuKyIIdAR9yOKE8uqQRCqBhQp3SXiMeIUla9tobjiOoGn/k0LFTdTJ0CyRvPg==
X-Received: by 2002:a05:600c:5124:b0:431:40ca:ce44 with SMTP id 5b1f17b1804b1-43161691682mr122114085e9.30.1729590933357;
        Tue, 22 Oct 2024 02:55:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgyq6n+8jcts2tjTo5SADW9rqMjfT6xN3E7y9DOoeJqaiyEJ0e6Yke+AVbsNQve6hNbgctXw==
X-Received: by 2002:a05:600c:5124:b0:431:40ca:ce44 with SMTP id 5b1f17b1804b1-43161691682mr122113835e9.30.1729590932884;
        Tue, 22 Oct 2024 02:55:32 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b93ea6sm6296161f8f.84.2024.10.22.02.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:55:32 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id DAE67160B2D3; Tue, 22 Oct 2024 11:55:31 +0200 (CEST)
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
Subject: Re: [PATCH bpf-next 3/5] selftests/bpf: don't mask result of
 bpf_csum_diff() in test_verifier
In-Reply-To: <20241021122112.101513-4-puranjay@kernel.org>
References: <20241021122112.101513-1-puranjay@kernel.org>
 <20241021122112.101513-4-puranjay@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 22 Oct 2024 11:55:31 +0200
Message-ID: <871q08ihrg.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_025540_610421_856C3783 
X-CRM114-Status: UNSURE (   7.42  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gVGhlIGJwZl9j
c3VtX2RpZmYoKSBoZWxwZXIgaGFzIGJlZW4gZml4ZWQgdG8gcmV0dXJuIGEgMTYtYml0IHZhbHVl
IGZvcgo+IGFsbCBhcmNocywgc28gbm93IHdlIGRvbid0IG5lZWQgdG8gbWFzayB0aGUgcmVzdWx0
Lgo+Cj4gVGhpcyBjb21taXQgaXMgYmFzaWNhbGx5IHJldmVydGluZyB0aGUgYmVsb3c6Cj4KPiBj
b21taXQgNjE4NTI2NmM1YTg1ICgic2VsZnRlc3RzL2JwZjogTWFzayBicGZfY3N1bV9kaWZmKCkg
cmV0dXJuIHZhbHVlCj4gdG8gMTYgYml0cyBpbiB0ZXN0X3ZlcmlmaWVyIikKPgo+IFNpZ25lZC1v
ZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheUBrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6
IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUByZWRoYXQuY29tPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
