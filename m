Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6FFCA5FC7
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74z0SqonaNDd1KQUwmOY1nsLnwybdfgcyHelMWtBS9M=; b=wlJwX88flkp3SU
	YERALqcl1gif44yAhrAz78lQO7egsc9rWOdTGYe9p7ZDgsq9QCtoIZyzu7eQ5qhwzRvWDv6wKBMMP
	mN3XsapdV0YZ6yjrV2SLxwn+hCWdJ8VIjhdURSDQLbYUTJCWgjK0c374vSKQkOSX9MJbHDgfoVNwL
	DnQ5t3kBO7Rt4A7oy9mx7SQJWWK1B62921WGDuV83YCJLYncaiIAtgHMcYBQJ6QsR8Pzd7kbmeY4u
	s7zoH+XmtwLXRxgK8ntLHO1V4LDaZst2ACVRN3WaJMAwk3hq/4saCxx30gYVnL9zmecwrn+mgirng
	rud5I5ebINoN32IsHlrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvRM-00000006L0l-2hEX;
	Wed, 30 Sep 2026 14:37:48 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvRJ-00000006Kzz-35Lg
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 14:37:47 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1432191137.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 07:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790779064; cv=none;
        d=google.com; s=arc-20260327;
        b=DJF/DMzvKrYg2l5sgBI/lCGN+8/jnBJgr3WFFHeWNw/Jgcxr1tKTvxlcm1G6Fc+l+C
         Dt0jVeA6ljdTCEzTLrMGDsLZi1PqtyrE4L2+5AJPOxCX+MM7Z0AUFVgcVH7SayDh6ZbX
         zmqvHxulfkOuTNddLZAsaaSIzapoXM0Qikg3woq5IruQePS+w8m13lU/tOpv7L4mMb0z
         cMY/taLsFyeTkU4+TV0Ao1PtL0tWvtI/Pj0m1EqYHAEdHevkVmTAwyB6J66FGtVg+RaS
         2l25s1uEP02jjxjSclKWnrn3HmGi6ZTFg0KYAPe0BxlfstsID97+1OzhOorvNkzmXCF5
         3QdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrGL1nV8lb3cnBxKMQABXnqttgXw91NKIu4eAmXKFA4=;
        fh=VcbCGCwUhYVSzfAVzhQGbjWifjJxN7o4alCNnrnulnQ=;
        b=n1JEq36OmtU743zRi3D01kE9C6ioYb2KMs/f8gXns5nJGE2ovbWj3CDXIVtVw/CXKN
         Oa63Oi6p/Y8HaRfpG6tYtIaVENIAhUORYGBqtLpJ9y2K5XbhyOo+ZPB1IG/khyaBrxbY
         JcaVnRy+JEs4Pd5MfuT5kMnBOPZt7XBkcT06fWBagIwavg4Thi86AeIvkUx92j9nrw73
         qEhU/306zw+iXfKvjdW6yO3GnTAeO+SL993vDUIQMin0wp3E015isuQskfqEpl+I0y6f
         3Ebwjnba2vA7XJdLD0tuhA67HSAV3EuJxW2h35298A3sCkIvoi9996+4mMychpwQx6p2
         YT+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779064; x=1791383864; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nrGL1nV8lb3cnBxKMQABXnqttgXw91NKIu4eAmXKFA4=;
        b=fAPnUlR1xwt+JAPDvYGILpl8tspgMSYz8orQg9aZIEpCn7rRyJErJB7WjkGyH/uhyG
         Mw4cPDyHq/VVQHWWz30gNNbcGi0hpxR+OiZqOXMG2lrfDAD9aoI2M+WYEnUjlz7TjQHB
         wdZJ7PUgP11TAGD7fH3SFLFSbjuU8AYy9GuW6ZqaVkYhLemNwsAXzX1ALLgJb+X7WN3B
         R1JIMUksglqkDlrPv0Sw0/JjQ8eDaNcaJZmJVqsMu3adO39QO5GUWdg5c31amSV57anM
         ub/FmUPH6bbYEQ5EKmhX2FoVSEpMRUu57L4VsSiX0kwNCaOKTL71+AiUuWflzWpDtRNm
         Gjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779064; x=1791383864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrGL1nV8lb3cnBxKMQABXnqttgXw91NKIu4eAmXKFA4=;
        b=ApD7kwG8N+bcBDZHarst9kKacH2jxAogoZTwiXQCGDpJAoqEuKQoH6crIvk/g8a2ln
         iOOz8IENCF7uAglP8cDBftrVI8o0p7DsznUvxbpl2PD6di5uAiG5VOwDWRHlllUMglvd
         aY9WXPItbJz87tq108NpgU8RtrVDlvOhWxaNKxeGseKSyMR0IiBkc05OE7ARxPkesinr
         JxDJF/mpzHAZmW4jnzJ0r4JadHLchNpe9I1w96V4VQ5Gl9lblmb3JgJhPmHr3Cql1rex
         su2yzZsltLc16v97W4BwRtOMbZltXPOEgzX1e/yJUw10aM6LZF86lP/OD7vxLdKiHpfd
         UNMQ==
X-Forwarded-Encrypted: i=1; AKwUvByMxWRLNoj/r3d52Ti4ReTYK/bjyh2MyzMUdHb37WKQHIGTSLC9Pyf+bLC2/j642AdPO+V9CBKzshRgBQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKNus+PdjfeVbXEnp0amV+3oQFo+T50SkGBMrrH8tBgKomfFeHu
	4qIsSoKShPbZPimaEEEnZPhEw0qnz+QIPzn5Fgsa280zzM4PXE5tpz7sl7Y6OYP4yfpMG0CVUIx
	0CxaFRS1cf2YvFQiI2lHIcifNJDXlJ3o=
X-Gm-Gg: AYBFou0mWxYwrXyYJWs9F+yeJmZ00/+mgqwjUo/HklVrunUB8I6PpxEoroPOk332lrF
	A6tuaQb+tcK0zn92ccd7vUdGKxKoK+Z+c1JRboAybm4H/YJEDYnccEdMcjfn+HdEKKIxb8m3B8j
	RohGQfFhCBx2wkc3pv5YdFYvRptjSLDrGi4bIeaxKZzYhFtlY27tOs7kPZv8fTmIplnTwzyywQp
	/Kjs6JcEwc0MOioifJZXiB05OY96fGFpwEfGWKMWR2/E4EjG37FBXJX0YmgD2G/N+ld/R5qaZ5P
	C4HtaHsi20uyCcbOdVNh8fv3VI5htuJdnBEpiYgbI6eCTooA1rhC4GOyo7RaYItfI4ek0he0adY
	6HGHrAtYERC4mR5jPDYyY
X-Received: by 2002:a67:f318:0:b0:7b7:39ec:51d5 with SMTP id
 ada2fe7eead31-7be72eacee4mr262776137.24.1790779063510; Wed, 30 Sep 2026
 07:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn> <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
In-Reply-To: <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
From: Han Gao <rabenda.cn@gmail.com>
Date: Wed, 30 Sep 2026 22:37:28 +0800
X-Gm-Features: AclHuK8xJHH-GchuoPDOK3EtJJuoEe-0ukOfyhbCCKAHr55R9addDARC_M8Pukk
Message-ID: <CAAT7Ki90CLoWwauNDShNFt4LS+3+nC-6tV1UqwAJP=KD0E56pQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_073745_909313_DF2ABFEF 
X-CRM114-Status: GOOD (  14.85  )
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

T24gV2VkLCBTZXAgMzAsIDIwMjYgYXQgNzo1MeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIFNlcCAyOSwgMjAyNiBhdCAwNjoyMjo0
NVBNICswODAwLCBIYW4gR2FvIHdyb3RlOgo+ID4gRG9jdW1lbnQgdGhlIE1pbGstViBNZWxlcyBi
b2FyZCBjb21wYXRpYmxlIHdpdGggdGhlIFRIMTUyMCBmYWxsYmFjay4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gPiAtLS0KPiA+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvdGhlYWQueWFtbCB8IDQgKysrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RoZWFkLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvdGhlYWQueWFtbAo+ID4gaW5kZXggMzAx
OTEyZGNkMjkwZTYwZjgxNmQzODAxNTI1OTExMDZkZTk0MTViNC4uNTM2MTAyMWI4ZGNjOTg5Nzgw
M2E1OTE1NjY1YzZiYjgzMzA5ZmU1MyAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi90aGVhZC55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvdGhlYWQueWFtbAo+ID4gQEAgLTIxLDYgKzIxLDEw
IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICBpdGVtczoKPiA+ICAgICAgICAgICAgLSBjb25z
dDogYmVhZ2xlLGJlYWdsZXYtYWhlYWQKPiA+ICAgICAgICAgICAgLSBjb25zdDogdGhlYWQsdGgx
NTIwCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogTWlsay1WIE1lbGVzIHNpbmdsZSBib2FyZCBj
b21wdXRlcgo+ID4gKyAgICAgICAgaXRlbXM6Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IG1pbGt2
LG1lbGVzCj4KPiBXaHkgaXNuJ3QgdGhpcyBlbnVtIHdpdGggdGhlIHByZXZpb3VzIGVudHJ5PwoK
TWVyZ2luZyB3aWxsIHJlc3VsdCBpbiB0aGUgbG9zcyBvZiBTQkMgbWFudWZhY3R1cmVyIGluZm9y
bWF0aW9uLgpNaWxrLVYgaXMgYW4gaW5kZXBlbmRlbnQgbWFudWZhY3R1cmVyLgoKVGhhbmtzLApI
YW4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
