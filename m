Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D73C47DDB
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbIKht7C03JvZkV3kdBubeB/PZwt5npxCF5Zsn7tzU8=; b=KIIpJtQOyOViksrbSKrE+hD0ad
	uK2k8ghhU1P89ZzQrICidy8KgzC45nqirkawYrC/Q+6N7PVKnhp7AVSBzXbM4xh0aInvxasneF0sq
	8UHZBvPMZx/mT4tGr31L2sW/t3h4na81ILawGwsoBulQ4fjZRuXOtcFd079N1gpGsOZbfKwxe3iN6
	iMlD1az/LuagFdxyKDeqYr3/zsInbHvHWhJSnKoBqB+EBrN9VPd+plzin2HQFTnaGZZH0vmWzr35h
	5S0iy6phJ6GrvsA+YoggZcLVI/ajnHHNGc5RpX0XdJ3IUvpTRfrrLyyFS3r26qTFZD8fhsrX0nCrw
	NWZJtONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVUkX-00000007WrD-3yrX;
	Thu, 01 Feb 2024 10:56:53 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVUkV-00000007Wp8-0Km2
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 10:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Fg8rVU3Nxutr7U/048wbPXJuIttyCXN6sJ43lXpWKNM=; b=cY3+ffXCncX46QIb+bLqTW4C++
	YSycUE3fmafTktOZXwDJgxvvFFfhTo7Gmwqr8j0Oatho2JvZigHGEsWVwBqTcSGdKO5VmVy/8OO91
	hlj7LemAlYptFK5C7mvwC6orDXfIx+X9f5JDsTe5peahB9xvd4K4p0x+nydkKjkiZe8j7vnWL1a3j
	HYF3rfUYkhgOpdXT5+HuTkvuPODtZ91kFvJbcen737GZv9QKGaP/N1/zf8BduBWTSqCtYB5vg+lEA
	Fmc7FcizHQp3e286Rsm9E0cX/VxxMFJLfenKc80KOLrKrnhoWhnjVRzvxTyPxXxd2ooEzf33E8Pd3
	b1GxXCPQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1rVUkG-0002ci-86; Thu, 01 Feb 2024 11:56:36 +0100
Received: from [81.6.34.132] (helo=localhost.localdomain)
	by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1rVUkF-00006P-49; Thu, 01 Feb 2024 11:56:35 +0100
Subject: Re: [PATCH bpf-next v3 0/4] Mixing bpf2bpf and tailcalls for RV64
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20240201083351.943121-1-pulehui@huaweicloud.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <1e7181e4-c4c5-d307-2c5c-5bf15016aa8a@iogearbox.net>
Date: Thu, 1 Feb 2024 11:56:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20240201083351.943121-1-pulehui@huaweicloud.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27172/Thu Feb  1 10:40:50 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_025651_139412_C6227A78 
X-CRM114-Status: GOOD (  16.22  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi8xLzI0IDk6MzMgQU0sIFB1IExlaHVpIHdyb3RlOgo+IEluIHRoZSBjdXJyZW50IFJWNjQg
SklULCBpZiB3ZSBqdXN0IGRvbid0IGluaXRpYWxpemUgdGhlIFRDQyBpbiBzdWJwcm9nLAo+IHRo
ZSBUQ0MgY2FuIGJlIHByb3BhZ2F0ZWQgZnJvbSB0aGUgcGFyZW50IHByb2Nlc3MgdG8gdGhlIHN1
YnByb2Nlc3MsIGJ1dAo+IHRoZSBUQ0Mgb2YgdGhlIHBhcmVudCBwcm9jZXNzIGNhbm5vdCBiZSBy
ZXN0b3JlZCB3aGVuIHRoZSBzdWJwcm9jZXNzCj4gZXhpdHMuIFNpbmNlIHRoZSBSVjY0IFRDQyBp
cyBpbml0aWFsaXplZCBiZWZvcmUgc2F2aW5nIHRoZSBjYWxsZWUgc2F2ZWQKPiByZWdpc3RlcnMg
aW50byB0aGUgc3RhY2ssIHdlIGNhbm5vdCB1c2UgdGhlIGNhbGxlZSBzYXZlZCByZWdpc3RlciB0
bwo+IHBhc3MgdGhlIFRDQywgb3RoZXJ3aXNlIHRoZSBvcmlnaW5hbCB2YWx1ZSBvZiB0aGUgY2Fs
bGVlIHNhdmVkIHJlZ2lzdGVyCj4gd2lsbCBiZSBkZXN0cm95ZWQuIFNvIHdlIGltcGxlbWVudGVk
IG1peGluZyBicGYyYnBmIGFuZCB0YWlsY2FsbHMKPiBzaW1pbGFyIHRvIHg4Nl82NCwgaS5lLiB1
c2luZyBhIG5vbi1jYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8gdHJhbnNmZXIKPiB0aGUgVENDIGJl
dHdlZW4gZnVuY3Rpb25zLCBhbmQgc2F2aW5nIHRoYXQgcmVnaXN0ZXIgdG8gdGhlIHN0YWNrIHRv
Cj4gcHJvdGVjdCB0aGUgVENDIHZhbHVlLiBBdCB0aGUgc2FtZSB0aW1lLCB3ZSBhbHNvIGNvbnNp
ZGVyIHRoZSBzY2VuYXJpbwo+IG9mIG1peGluZyB0cmFtcG9saW5lLgo+IAo+IEluIGFkZGl0aW9u
LCBzb21lIGNvZGUgY2xlYW5zIGFyZSBhbHNvIGF0dGFjaGVkIHRvIHRoaXMgcGF0Y2hzZXQuCj4g
Cj4gVGVzdHMgdGVzdF9icGYua28gYW5kIHRlc3RfdmVyaWZpZXIgaGF2ZSBwYXNzZWQsIGFzIHdl
bGwgYXMgdGhlIHJlbGF0aXZlCj4gdGVzdGNhc2VzIG9mIHRlc3RfcHJvZ3MqLgo+IAo+IHYzOgo+
IC0gUmVtb3ZlIGR1cGxpY2F0ZSBSVl9SRUdfVENDIGxvYWQgaW4gZXBpbG9ndWVpLiAoQmrDtnJu
IFTDtnBlbCkKCklpdWMsIHRoaXMgc3RpbGwgbmVlZHMgYSByZXNwaW4gYXMgcGVyIHRoZSBvbmdv
aW5nIGRpc2N1c3Npb25zLiBBbHNvLAppZiB5b3UgaGF2ZSB3b3JrZWQgb24gQlBGIHNlbGZ0ZXN0
cyB3aGljaCBleGVyY2lzZSB0aGUgY29ybmVyIGNhc2UKYXJvdW5kIGE2LCBwbGVhc2UgaW5jbHVk
ZSB0aGVtIGluIHRoZSBzZXJpZXMgYXMgd2VsbCBmb3IgY292ZXJhZ2UuCgpUaGFua3MsCkRhbmll
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
