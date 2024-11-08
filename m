Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71572D5C0C0
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X+r/IhIU5VYlDnXqjp4tE9rmNpU8tW5VKWnhSuQcTks=; b=2zsVaQxzdTnxLV
	YkfLwM8uidW3N6ZEjUHBwY7Vy+vTKu6OtsxLhxIlH0IUtb0Ffw8/DpEaGTpZX15F3ENg4vGZVnw6s
	sr07dJX7Fr0ukxCf6DumAvBum1DibOUQO/WJ6jBS/kOiHHgAiiTQmqBa2XPqLPrdFoMMFjkbAGI5G
	cMFVsn9XpZ30q2DDd253Hu65rn6kkTfeTdln2gxjgrcjT9liX8WPJL2TwDl8oiEadacEWHpDEw4Ip
	u0ZEVqo/jCdNoEDbMTGo4WYM4IjnGuF/44p+zDXJvIcO6kXkopdbiuGykU0PYdSavu7LmLY55ZKog
	8SLLx881w90CGfUS+oAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Nm7-0000000ASSR-1P2o;
	Fri, 08 Nov 2024 12:07:39 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NJD-0000000AN0A-0Ptr
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 11:37:57 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-83b83f83b63so89880439f.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 03:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1731065865; x=1731670665; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uOXTxT3QVzkr6+CIu71XOWqnHn0lKuAZkobd+xubmCQ=;
        b=C3pMQ0+lKa5y0fAQyxN6WWVyZP0L40mkuUnoTgHaRm9/hhgq4wco46aF3wofu9yjjE
         5yDdL0BjmsxtvDOjGckwSAa0twsmpNPTOUXrBqubn9wFyM/BF5sXr5W6HrGo0fVAAuoI
         KNQqtz3iapv51jgH6T/SoAP6VH2IZDIW3Uiv1VwhSmUIUbL24uZkUE5MKSc+GU0/XyfY
         q7tm+Myh5D0yQ+rmbqoWcYxT+zFtKKFJuaqewY5Rg3h0BCNJjP2dV72olNKYM9lnOpHL
         G4P49o5DUBtRgzBDzqI8GZ4TeEjLTiTT6Da6oUmzZLRzNYw1fGqU2zmBaVTh5hi3TlnW
         xu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065865; x=1731670665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOXTxT3QVzkr6+CIu71XOWqnHn0lKuAZkobd+xubmCQ=;
        b=eW7vwuwgeiV9kizaz3PHoGspa7k7bpo+OGIlW00Tr7pZCdkBnH2S0c5/3GX//9tAfN
         IkqH0OOTAk8hUDu1xhiqiqbSrutqmQ/L2XTS5LVT/ru4UFZCyR7qpifZzRMp4XhZqhdc
         5seC9ViFxkPC07m3s/QY20ZrfOf8twoBtzvXT/D+Jzjx5rn8eZms5Q7exE+eRoYlga7G
         4yWdAkPpXMP3s4y6rd1Vl2KcsMjsBp1Ign1i9BCSglfPeGO2b2VEAO9RWRShqNv9vyyn
         0EpSFfjxowe/lo6qvRy+4CzGPg92GC2DeWZqfxufz7mvhcPanwtrlwxiLyK1+M6xfviV
         bHrw==
X-Forwarded-Encrypted: i=1; AJvYcCWduOnDlcaBqTNkYVjLmknpbFlGPrU9ujytlHVC66ZdEgxKzH94s1K+D8vS3gFOPRaWGxtGAUCmo83o1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxocJWbf3NgOFLgFLMKAGrA0KutixLuwbt8WVRyt7M0JWVSOjVw
	XG2VKT5wMC3gFC2GNEj0aC8YnwBz2vKHh1L94pTTUSNk7TWYuQNdu4YU+ld2Pp9efgKJROXy6Fb
	L1C2FC9V2IFW9BUTCsNremsnqJhesJFHPhy/Xlq46yp8gw+aX
X-Google-Smtp-Source: AGHT+IF+ciN17ub4TIrETUvpzLaSq6I/9rWGP4XRPhpnawOHx3FcfWs8O7SeGXcL/Hobw0nycafCJTqEinG8leLSWHc=
X-Received: by 2002:a05:6e02:349c:b0:3a0:9c04:8047 with SMTP id
 e9e14a558f8ab-3a6f24b2433mr21370795ab.6.1731065865452; Fri, 08 Nov 2024
 03:37:45 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Nov 2024 17:07:34 +0530
Message-ID: <CAAhSdy1iTNc5QG34ceebMzA137-pNGzTva33VQ83j-yMoaw8Fg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.13
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_033747_451270_A804A618 
X-CRM114-Status: UNSURE (   9.02  )
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

SGkgUGFvbG8sCgpXZSBoYXZlIHRoZSBmb2xsb3dpbmcgS1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2
LjEzOgoxKSBBY2NlbGVyYXRlIEtWTSBSSVNDLVYgd2hlbiBydW5uaW5nIGFzIGEgZ3Vlc3QKMikg
UGVyZiBzdXBwb3J0IHRvIGNvbGxlY3QgS1ZNIGd1ZXN0IHN0YXRpc3RpY3MgZnJvbSBob3N0IHNp
ZGUKCkluIGFkZGl0aW9uLCB0aGUgcG9pbnRlciBtYXNraW5nIHN1cHBvcnQgKFNzbnBtIGFuZApT
bW5wbSkgZm9yIEtWTSBndWVzdCBpcyBnb2luZyB0aHJvdWdoIHRoZSBSSVNDLVYgdHJlZS4KCkkg
YWxzbyBoYXZlIFN2YWRlIGFuZCBTdmFkdSBzdXBwb3J0IGZvciBob3N0IGFuZCBndWVzdAppbiBt
eSBxdWV1ZSB3aGljaCBJIHdpbGwgc2VuZCBpbiB0aGUgc2Vjb25kIHdlZWsgb2YgdGhlCm1lcmdl
IHdpbmRvdyB0byBhdm9pZCBjb25mbGljdCB3aXRoIHRoZSBSSVNDLVYgdHJlZS4KClBsZWFzZSBw
dWxsLgoKUmVnYXJkcywKQW51cAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4
MTk4Mzc1ODQzMDk1N2Q5YTVjYjMzMzNmZTMyNGZkNzBjZjYzZTdlOgoKICBMaW51eCA2LjEyLXJj
NSAoMjAyNC0xMC0yNyAxMjo1MjowMiAtMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0OgoKICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0
YWdzL2t2bS1yaXNjdi02LjEzLTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAzMzJm
YTRhODAyYjE2Y2NiNzI3MTk5ZGE2ODUyOTRmODVmOTg4MGNiOgoKICByaXNjdjoga3ZtOiBGaXgg
b3V0LW9mLWJvdW5kcyBhcnJheSBhY2Nlc3MgKDIwMjQtMTEtMDUgMTM6Mjc6MzIgKzA1MzApCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCktWTS9yaXNjdiBjaGFuZ2VzIGZvciA2LjEzCgotIEFjY2VsZXJhdGUgS1ZNIFJJU0Mt
ViB3aGVuIHJ1bm5pbmcgYXMgYSBndWVzdAotIFBlcmYgc3VwcG9ydCB0byBjb2xsZWN0IEtWTSBn
dWVzdCBzdGF0aXN0aWNzIGZyb20gaG9zdCBzaWRlCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFudXAgUGF0ZWwgKDEzKToK
ICAgICAgUklTQy1WOiBLVk06IE9yZGVyIHRoZSBvYmplY3QgZmlsZXMgYWxwaGFiZXRpY2FsbHkK
ICAgICAgUklTQy1WOiBLVk06IFNhdmUvcmVzdG9yZSBIU1RBVFVTIGluIEMgc291cmNlCiAgICAg
IFJJU0MtVjogS1ZNOiBTYXZlL3Jlc3RvcmUgU0NPVU5URVJFTiBpbiBDIHNvdXJjZQogICAgICBS
SVNDLVY6IEtWTTogQnJlYWsgZG93biB0aGUgX19rdm1fcmlzY3Zfc3dpdGNoX3RvKCkgaW50byBt
YWNyb3MKICAgICAgUklTQy1WOiBLVk06IFJlcGxhY2UgYWlhX3NldF9odmljdGwoKSB3aXRoIGFp
YV9odmljdGxfdmFsdWUoKQogICAgICBSSVNDLVY6IEtWTTogRG9uJ3Qgc2V0dXAgU0dFSSBmb3Ig
emVybyBndWVzdCBleHRlcm5hbCBpbnRlcnJ1cHRzCiAgICAgIFJJU0MtVjogQWRkIGRlZmluZXMg
Zm9yIHRoZSBTQkkgbmVzdGVkIGFjY2VsZXJhdGlvbiBleHRlbnNpb24KICAgICAgUklTQy1WOiBL
Vk06IEFkZCBjb21tb24gbmVzdGVkIGFjY2VsZXJhdGlvbiBzdXBwb3J0CiAgICAgIFJJU0MtVjog
S1ZNOiBVc2UgbmFjbF9jc3JfeHl6KCkgZm9yIGFjY2Vzc2luZyBILWV4dGVuc2lvbiBDU1JzCiAg
ICAgIFJJU0MtVjogS1ZNOiBVc2UgbmFjbF9jc3JfeHl6KCkgZm9yIGFjY2Vzc2luZyBBSUEgQ1NS
cwogICAgICBSSVNDLVY6IEtWTTogVXNlIFNCSSBzeW5jIFNSRVQgY2FsbCB3aGVuIGF2YWlsYWJs
ZQogICAgICBSSVNDLVY6IEtWTTogU2F2ZSB0cmFwIENTUnMgaW4ga3ZtX3Jpc2N2X3ZjcHVfZW50
ZXJfZXhpdCgpCiAgICAgIFJJU0MtVjogS1ZNOiBVc2UgTkFDTCBIRkVOQ0VzIGZvciBLVk0gcmVx
dWVzdCBiYXNlZCBIRkVOQ0VzCgpCasO2cm4gVMO2cGVsICgxKToKICAgICAgcmlzY3Y6IGt2bTog
Rml4IG91dC1vZi1ib3VuZHMgYXJyYXkgYWNjZXNzCgpRdWFuIFpob3UgKDIpOgogICAgICByaXNj
djogcGVyZjogYWRkIGd1ZXN0IHZzIGhvc3QgZGlzdGluY3Rpb24KICAgICAgcmlzY3Y6IEtWTTog
YWRkIGJhc2ljIHN1cHBvcnQgZm9yIGhvc3QgdnMgZ3Vlc3QgcHJvZmlsaW5nCgpZb25nLVh1YW4g
V2FuZyAoMSk6CiAgICAgIFJJU0MtVjogS1ZNOiBGaXggQVBMSUMgaW5fY2xyaXAgYW5kIGNscmlw
bnVtIHdyaXRlIGVtdWxhdGlvbgoKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAg
IHwgIDEwICsrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9uYWNsLmggICB8IDI0NSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGVyZl9ldmVudC5oIHwgICA2ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggICAgICAg
IHwgMTIwICsrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvcGVyZl9jYWxsY2hh
aW4uYyAgfCAgMzggKysrKysrCiBhcmNoL3Jpc2N2L2t2bS9LY29uZmlnICAgICAgICAgICAgICB8
ICAgMSArCiBhcmNoL3Jpc2N2L2t2bS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAyNyArKy0tCiBh
cmNoL3Jpc2N2L2t2bS9haWEuYyAgICAgICAgICAgICAgICB8IDExNCArKysrKysrKysrKy0tLS0t
LQogYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgICAgICAgICAgfCAgIDMgKy0KIGFyY2gvcmlz
Y3Yva3ZtL21haW4uYyAgICAgICAgICAgICAgIHwgIDYzICsrKysrKysrKy0KIGFyY2gvcmlzY3Yv
a3ZtL21tdS5jICAgICAgICAgICAgICAgIHwgICA0ICstCiBhcmNoL3Jpc2N2L2t2bS9uYWNsLmMg
ICAgICAgICAgICAgICB8IDE1MiArKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2t2
bS90bGIuYyAgICAgICAgICAgICAgICB8ICA1NyArKysrKystLS0KIGFyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyAgICAgICAgICAgICAgIHwgMTkxICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgIHwgIDExICstCiBhcmNoL3Jpc2N2L2t2
bS92Y3B1X3N3aXRjaC5TICAgICAgICB8IDEzNyArKysrKysrKysrKystLS0tLS0tLQogYXJjaC9y
aXNjdi9rdm0vdmNwdV90aW1lci5jICAgICAgICAgfCAgMjggKystLS0KIDE3IGZpbGVzIGNoYW5n
ZWQsIDEwMjIgaW5zZXJ0aW9ucygrKSwgMTg1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX25hY2wuaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvcmlzY3Yva3ZtL25hY2wuYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
