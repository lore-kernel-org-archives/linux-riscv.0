Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C23606A323
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 14:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IdOCEXh3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=QHABelTh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zi7ArreyDlVyXxPfJqqbe5+Tu7371Xz+ZR88+2Q5nPM=; b=IdOCEXh3amda+bizr1TJ71FwBJ
	J+2E+OkWYEBRawSAtlrKcOXYZMwGLCFsENfszfXZYiCZ/2Tm/tBhtZ1TvDcRUOsmxITZIH3bsnEj/
	Ic4fdpvsMZCGJbGvHCSNNxxIkpvLI4yvSbU5SeruGQz19rT7e/h4c8eGXrERr7B4XUbFNqmMxBCCW
	WNzagJDj960OUHHhiRDa4SfE5hzHo7GomnlpThVGNr9hmPPn5sOPHBr3QpEmm7x3biYq5ksNEJDKO
	ULD1i+XabixXjkLTUx2zVUe1dR1al5XfNdvKXs+pRSDeWDYeTqyKRRyfRu+TQ4ASbjYY7jNCdnfdO
	Y7TXzblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKD-0000000GWeZ-0sdJ;
	Fri, 23 Oct 2026 14:32:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKA-0000000GWcK-2GdT
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 14:32:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-487049569b6so563984f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 07:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765969; cv=none;
        d=google.com; s=arc-20260327;
        b=ELv0Cyif5MaRAr1TpSG1ejCAnP2TkMdSSPn8wJxFvIuWDYMlWB0PcaCebEHMNS/sJh
         6Q0mYNIjtfcZE1/lfcilee7B9neHgkOwFRbTnWIxotC+F+AiNHmaG8unMG5jmoF57kfl
         yQKcgPbn8LNrZA+vYQF8vIZqhtK1FLGLs4OEIS6IQEHv4OSLGRp1kDFaGqlwfi5Rbg0H
         H08hy8pVOb+3qhQUw+NlzdEJGL1R2ysKoY5UaoqCkZvr9run8hYZt/rISOj3ZZckGXNW
         E+HHcuPFOsot6/QUQEV7/0ekgGUyP6Lq2Ro5Lnx62aEINjpbRUGOZ0klF36ZEKdjQWAN
         Fi+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        fh=FXVMaxTO957KFaQBjMOCFHNs44h/8EZblG+5t/spya0=;
        b=RoMIOLQTXCNO0CGTUENy3QBnNBpbxsFoXTMaYRko4woHoBUzG9DaF0nC+icxt3jejD
         JMlkPJfoG7DofE/J5G86UJCnwKEJ1BiHVqzmtc91qjL4o84fLi2n2dTxMXMVioiMJmEI
         NIxabzJf2aZbJRAWy1Gl5yNNGHHKKqWdsQQeYarBwgRaFPQh11YbRs4lHhm8hsR7ivZE
         A/QI0+i9CcZX8TjfSVSq2gRKi+VPsr58XDYjW85YjLIqszh6V8nvlntsGdV4KJVV9AKY
         i/SLAGTJn3E7UZJdLC5/CrBCdfwxuRN88AyzX31zSxhKVxK2j2KNsgldI7PjGe9aTPXZ
         XJPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765969; x=1793370769; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        b=QHABelThuFl9YLaS91sPxD2z+9NGm1YXDBWh1DavbxSk/DrUD6Sx3j+IJPdmSawJNo
         eH3gJ3/xT7BjYSUNUKyEXEJ+BNvHQxemzAQPM4qtNelcNOOU4oNC+xv/DAiaI3Q3vgLH
         eeXrfi12Y8tMvBl2I1185ieOqG1d0EEMHv4xXGS7uRtBHwdF4Bn5mBgl8ulKMc0+A3ln
         K5p7VTxwZPtOTHKLNQQDiDQHFrHgySyYUWCbfJbU4e+iZGLGkVXTpmCuahohP5rmAbhN
         SNi7te8FCFPJx1q3xJ4bzsZNlgErBDxxmsaQfX+nLXS0eO3vuQDUlcEo2/1dbUuH9ln0
         +Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765969; x=1793370769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TW65mbXqWZmqBGg9YKq6hDH16N5mBPAA1Vl05PFK9vE=;
        b=pUGxLQ/2rn7xu0oUCjAu7HwXCEAMsb0wLk4dNKuFTtR147lzIae8bpeDy6Zs5y2LeS
         dhqTe4wlcYNRf5iRqE73VkiJ3H0O71NWEZRaX3PHfOH1y+3FwcY0Tfr/z0yfqfDTG9is
         fGqo0pcOzzpkWpODblU5+Fv7QhDlFiTDlF0ZEz0RbI1e2hj772zXCDDuGwfUZej64cxB
         fmHiX35kRBc5GnEABXGssz/jowMKO+xUAJveDs6c0Jo66EUfDaQRheCAuHrQKThVU9Km
         dtm2YHZc09NMpbhOskqnA/Tvhd3LbgjdkiNLNvZXQ/L8hX4MDCvxfjiW6DrEZJO/igo4
         /8JA==
X-Forwarded-Encrypted: i=1; AKwUvBzbVsiB/wL1RBVl7BKSsEZbgOKnay3PmsSMY8JXRiyWi2OXEZNYqx4QdJnoF0FLQY8ugPwOf/ijW6y50A==@lists.infradead.org
X-Gm-Message-State: AFq9FYLxcaUNxGn8Zwv7j+8HAhYBRdv3iI3TaUedqjE63t5hrXlFb86P
	eRG0kv40+6fxazvE1ZT4hybYP1o9SP0PS6Fd0Pj99X2FLVE2GsmSzPhbvxrOOd6Se7+dK9+zavi
	QuSoNhkoPF3XoaCXUhKmSL8ZBBFwoNem8MMkNouqTQQ==
X-Gm-Gg: AYBFou0QlEJZkP0glkqJy4DCEdtedSHr6810L+afjFVz7sUyyu54LbKZA3sSJFkTVP3
	b7skkBQ0rR7O15ZJtKykKfR0foscATE4IUX6aSBBSnjyl/4JXkp2VgmV+X8f1apFr3gvAxF0FWO
	LNlboYMLy/aK1KKrmgJQfgZtELZUdKqgXatmyEBNaGb9daHwYnMzniH/lsvVd3ESR9jShnDLc2g
	RIeH/5ZgvLTQzjOYRkifupapje5XJMbMo1utvgkdA7oUsNl+f49DZmBNVo8MwxsZ342aiUBOeq/
	u2SIv9vZFJRH5/4G7Gb94fwvnbeK4am6KOVgpHL8qU4l6FQLWfGa5+Sy+C5fm9OQshnOlef6XFP
	it4DmErAstrFHw3/vfSjtAMobrQ1aWFilRhrGHQ2m/pGQPd99w2jsNmPLoRzQ3ALuIDkpfoYgox
	MAoMFeofm82HLbgncxAdXU8T1R0PxxvZX/G3Y/v8d1WyeqX/wnLuu89Qa/
X-Received: by 2002:a5d:5f86:0:b0:48c:6f3a:fe30 with SMTP id
 ffacd0b85a97d-48e3859dda4mr4501759f8f.15.1792765968503; Fri, 23 Oct 2026
 07:32:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-10-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-10-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:35 +0530
X-Gm-Features: AclHuK-ELQwc782e_gNWzhlyxMyHtzq3L9uZbtZpWmLCC250qaSxVHzfJurC7sQ
Message-ID: <CAAhSdy0uq6AjzigiLSjTZEZ4JTOphcupx88Sf24kjBVDWB4new@mail.gmail.com>
Subject: Re: [PATCH v9 10/20] dt-bindings: riscv: add Counter delegation ISA
 extensions description
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_073250_613427_D40E0BF1 
X-CRM114-Status: GOOD (  18.15  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBBdWcgNywgMjAyNiBhdCAxOjM54oCvUE0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBGcm9tOiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4KPgo+IEFkZCBkZXNjcmlwdGlvbiBmb3IgdGhlIFNtY2RlbGVnL1NzY2NmZyBleHRlbnNp
b24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4K
PiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBM
aW5rOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA3MDEtY291bnRlcl9kZWxlZ2F0aW9u
LXY4LTEwLTc5MDlmODYzYTY0NUBtZXRhLmNvbQo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgV2FsbXNs
ZXkgPHBqd0BrZXJuZWwub3JnPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCAgICAgIHwgNDEgKysrKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sCj4gaW5kZXggZWVlNjVjZjczZDZjLi4yNGVmZDNlMWNmOGUgMTAwNjQ0Cj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwKPiBAQCAtMTgxLDYgKzE4MSwxMyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgICBjaGFu
Z2VzIHRvIGludGVycnVwdHMgYXMgZnJvemVuIGF0IGNvbW1pdCBjY2JkZGFiICgiTWVyZ2UgcHVs
bAo+ICAgICAgICAgICAgICByZXF1ZXN0ICM0MiBmcm9tIHJpc2N2L2poYXVzZXItMjAyMy1SQzQi
KSBvZiByaXNjdi1haWEuCj4KPiArICAgICAgICAtIGNvbnN0OiBzbWNkZWxlZwo+ICsgICAgICAg
ICAgZGVzY3JpcHRpb246IHwKPiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNtY2RlbGVnIG1h
Y2hpbmUtbGV2ZWwgZXh0ZW5zaW9uIGZvciB0aGUgbWFjaGluZSBtb2RlCj4gKyAgICAgICAgICAg
IHRvIGRlbGVnYXRlIHRoZSBocG1jb3VudGVycyB0byBzdXBlcnZpc29yIG1vZGUgc28gdGhhdCB0
aGV5IGFyZQo+ICsgICAgICAgICAgICBkaXJlY3RseSBhY2Nlc3NpYmxlIGluIHRoZSBzdXBlcnZp
c29yIG1vZGUgYXMgcmF0aWZpZWQgaW4gdGhlCj4gKyAgICAgICAgICAgIDIwMjQwMjEzIHZlcnNp
b24gb2YgdGhlIHByaXZpbGVnZWQgSVNBIHNwZWNpZmljYXRpb24uCj4gKwo+ICAgICAgICAgIC0g
Y29uc3Q6IHNtY250cnBtZgo+ICAgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiAgICAgICAgICAg
ICAgVGhlIHN0YW5kYXJkIFNtY250cnBtZiBtYWNoaW5lLWxldmVsIGV4dGVuc2lvbiBmb3IgdGhl
IG1hY2hpbmUgbW9kZQo+IEBAIC0yMjAsNiArMjI3LDE0IEBAIHByb3BlcnRpZXM6Cj4gICAgICAg
ICAgICAgIGJlaGF2aW91cmFsIGNoYW5nZXMgdG8gaW50ZXJydXB0cyBhcyBmcm96ZW4gYXQgY29t
bWl0IGNjYmRkYWIKPiAgICAgICAgICAgICAgKCJNZXJnZSBwdWxsIHJlcXVlc3QgIzQyIGZyb20g
cmlzY3YvamhhdXNlci0yMDIzLVJDNCIpIG9mIHJpc2N2LWFpYS4KPgo+ICsgICAgICAgIC0gY29u
c3Q6IHNzY2NmZwo+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiArICAgICAgICAgICAgVGhl
IHN0YW5kYXJkIFNzY2NmZyBzdXBlcnZpc29yLWxldmVsIGV4dGVuc2lvbiBmb3IgY29uZmlndXJp
bmcKPiArICAgICAgICAgICAgdGhlIGRlbGVnYXRlZCBocG1jb3VudGVycyB0byBiZSBhY2Nlc3Np
YmxlIGRpcmVjdGx5IGluIHN1cGVydmlzb3IKPiArICAgICAgICAgICAgbW9kZSBhcyByYXRpZmll
ZCBpbiB0aGUgMjAyNDAyMTMgdmVyc2lvbiBvZiB0aGUgcHJpdmlsZWdlZCBJU0EKPiArICAgICAg
ICAgICAgc3BlY2lmaWNhdGlvbi4gVGhpcyBleHRlbnNpb24gZGVwZW5kcyBvbiBTc2NzcmluZCwg
U21jZGVsZWcsIFppaHBtLAo+ICsgICAgICAgICAgICBaaWNudHIgZXh0ZW5zaW9ucy4KPiArCj4g
ICAgICAgICAgLSBjb25zdDogc3NjY3B0cgo+ICAgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiAg
ICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNzY2NwdHIgZXh0ZW5zaW9uIGZvciBtYWluIG1lbW9y
eSAoY2FjaGVhYmlsaXR5IGFuZAo+IEBAIC0xMTM1LDYgKzExNTAsMzIgQEAgcHJvcGVydGllczoK
PiAgICAgICAgICAgICAgYWxsT2Y6Cj4gICAgICAgICAgICAgICAgLSBjb25zdDogemlsc2QKPiAg
ICAgICAgICAgICAgICAtIGNvbnN0OiB6Y2EKPiArICAgICAgIyBTbWNkZWxlZyBkZXBlbmRzIG9u
IFNzY3NyaW5kLCBaaWhwbSwgWmljbnRyCj4gKyAgICAgIC0gaWY6Cj4gKyAgICAgICAgICBjb250
YWluczoKPiArICAgICAgICAgICAgY29uc3Q6IHNtY2RlbGVnCj4gKyAgICAgICAgdGhlbjoKPiAr
ICAgICAgICAgIGFsbE9mOgo+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+ICsgICAgICAgICAg
ICAgICAgY29uc3Q6IHNzY3NyaW5kCj4gKyAgICAgICAgICAgIC0gY29udGFpbnM6Cj4gKyAgICAg
ICAgICAgICAgICBjb25zdDogemlocG0KPiArICAgICAgICAgICAgLSBjb250YWluczoKPiArICAg
ICAgICAgICAgICAgIGNvbnN0OiB6aWNudHIKPiArICAgICAgIyBTc2NjZmcgZGVwZW5kcyBvbiBT
bWNkZWxlZywgU3Njc3JpbmQsIFppaHBtLCBaaWNudHIKPiArICAgICAgLSBpZjoKPiArICAgICAg
ICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBjb25zdDogc3NjY2ZnCj4gKyAgICAgICAgdGhl
bjoKPiArICAgICAgICAgIGFsbE9mOgo+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+ICsgICAg
ICAgICAgICAgICAgY29uc3Q6IHNtY2RlbGVnCj4gKyAgICAgICAgICAgIC0gY29udGFpbnM6Cj4g
KyAgICAgICAgICAgICAgICBjb25zdDogc3Njc3JpbmQKPiArICAgICAgICAgICAgLSBjb250YWlu
czoKPiArICAgICAgICAgICAgICAgIGNvbnN0OiB6aWhwbQo+ICsgICAgICAgICAgICAtIGNvbnRh
aW5zOgo+ICsgICAgICAgICAgICAgICAgY29uc3Q6IHppY250cgo+Cj4gIGFsbE9mOgo+ICAgICMg
WmNmIGV4dGVuc2lvbiBkb2VzIG5vdCBleGlzdCBvbiBydjY0Cj4KPiAtLQo+IDIuNTMuMC1NZXRh
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
