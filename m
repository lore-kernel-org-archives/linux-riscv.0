Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0AA606A327
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 17:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jIxiSre9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6YFcgZ+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=R5190BPsz8Z0yaNc84Pz//RdZpRFqJlgb3iF1sPqwrw=; b=jIxiSre9uOklS5dQ24tM5VCjjj
	AjLQUQV/T+isnwJFW3IBr2nSt5H20f40K9y+EdxUm+VKDHzHBbvY16P49bVw8fY15cH10WRih4Z4y
	/cKPCndA2Ff/5RCziETVeftNhE+7fv/CaQhSUccr0iVtmQPX7QjqXDIk+paSdxJO7hPwEJ4vYQNqr
	Th2jJmgUW09l95IhaWiSypk92pjUeF/83c5IOD3nyvopcs8y+NhnWa6CNh4ClywzJyj0tcXCm19bO
	HwumOf2UP6wtibh6TEhMssFzMRvZ0gQnMdfIl2JgFNnerwNIuvgwmJoQ7Ba8YpOsJaSpbT9CpLc8t
	6ejFgvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSHkh-0000000GYci-2hDw;
	Sat, 14 Nov 2026 17:41:23 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSHke-0000000GYcJ-45Dk
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 17:41:22 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6798eb0d190so1537031d50.3
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 09:41:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794678079; cv=none;
        d=google.com; s=arc-20260327;
        b=a56azTqva43M97fGl2/6AE/6fZRyaASRiZlRy9Yrj4bhZOYyO2YyVVS5tUYVFNoFLe
         e8MW1WQYfp/XEcsOLXXF19RCezfMiT8928XTD/dpyvAENJak5h1ljPkU+0+79K3kN4kn
         5wmT4vByAEsSRF00EtcW0R7zmXT2jA0mVYdcR/LwX8D6kXBEYR8DIp7Aeg+MC8ErZnc9
         MINJtFx0N8nEfanS/XLziRk2usG2ZO99bhZAaU5RtkGzPi80nkF/7Zmlz/ktiPJwexv7
         w9LR7UZQVqV/QmXY0tJA1YWYi2hlqptYU15h/Im3AdnB0O92NvoppVUaN3X3etxjpOfe
         YgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lKzBfGPktJr/szDz2t15shFB1sRF8TZoz1RWFch5hCA=;
        fh=f1iazWXtmTRZ29CM8hggKMfyNuklhqAfOSEKQVQkMyM=;
        b=rkk5xNsYtkACueT9TUmFRzAhah11cPwWNtTlIXViPRqJNWleqZzyuSYTwIAkGTP9YG
         CWDPJW97nzQ6Rir0WAfjaSdKArkxkuolLp2hoGZLc+7BF6ORwA3rS6QfZLdwGkjPKup7
         4wpreoBZ0RRCyHniu7R6BbOEfQtwfImImh6ABMG52mCblJ3iHJ2uPGN/dVsnXM6BnGt4
         WTTVFpB4Drecn8R6gpNlAHyTrZ58VhZH5A/WDXSsoO2K8iWXd1DwlfBtX8ZPWR/JxWBl
         KkQDVK6yx421v41Opfk4MgIsw+E9Rdegd0aHupRVnKwAVXRw/ZB+dhgyTFqRaNYS6Tkv
         Wrgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678079; x=1795282879; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKzBfGPktJr/szDz2t15shFB1sRF8TZoz1RWFch5hCA=;
        b=n6YFcgZ+inRd6Qb8Q4v2eWUzbWVcEkOgMxBISWClN9ulrefG0bll1PQeU+QzSFN+3y
         V5ma82Fs4uwjVWrE4MLMVJbgZqMYGH0ruPznKYWW8KnOCxoIBDdxCb6lLJb/fxxutP7k
         qwa1pWiYsuzWCCPcs86Qe40uueYFRPK24grh8BjoIrbBgnXpoouKHo32/eJSgoeswSNa
         d4cpHOFu1iVqIWZPzb0hMEFHtkS3r0hZsgzc+CCeiEmGy6UGhZl2Ze8NbsyPJJXOTFm6
         d4ANxrtxCwn0nOZqmxE9Bj9+59FmFWgqnMhvPcnOOXQBBryUNpJ599/rnazw0Io+w+/h
         DkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678079; x=1795282879;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKzBfGPktJr/szDz2t15shFB1sRF8TZoz1RWFch5hCA=;
        b=fIocZLacItk0A5Mh33RuuPGQbVz8omsD27aoA9pGKiwk0zVdZhc/GaKH483ejyWSW0
         AE6vI1R6zW/2K3A3po3HSaWY8I4zFDRC8VogXRk/O62aIIP8/lZRGMMSrUQ0Pqfq9n2F
         kcW6mUXDuww7Yj5o4To5/DJvNv5gZkOoHxWp/WYCt6RI1SqPOHqMwNm9LgR95xfCNN+V
         +4ZTfaciw9GqY0YUdUof8XeMCbiW58pOFM4OJzjl/HA3LjHBf9Uo8cQI0rQ+aUTx+uY2
         lPhjNc78XbIU/oyqJ2NxkE7a65+UlNMSTHfiaSw0sIHA7jk/ylwuVjMxnuZVrFFyCZhG
         hc+g==
X-Gm-Message-State: APuU4Z/g3UkQpn0NuIPN7Bu5CMrZGnE/A1CyPMpbdGSJhPcG/sX9ifCn
	I6eJLsEqKzpExgEy6hCYKvQlJ57WxAtpF5FWi5z9MVGa3NLwX7NyEOEu5r4pUBn0eakFkS2Pqaj
	IcGkfLCf4BlbxPPTU2RTPjyItYTKHqWTPKO0D
X-Gm-Gg: AYBFou1O303ELjbcEKjiGHs5K5cf31ZxmK6W4Xqdnd5zH/TVwRLVS+iPnEtNIUmnDJI
	vRqLmv5h7e/LzasuD6VtVMndaigYQVuuB30QU67+DHhX9cpY7ng6xeNBnNk9L9JEIFSsrWkzsv0
	L+ixrZ6IcBXsvd51k3SYWGgU0Xs02qFly0TNKkFz6uXvAPSczFTsg704ICPuxmbcRl6F+sEIEJj
	BMyidt73uKTKOBrg1bWIzNBEBKq7biAlnxmjLK2z7BgXJ4ITdl0Uc03pCrBjPG6wX54vi+YSv2i
	339vAAS3WbQclai0VfHTNmoO19ZBt0WvUH9FEQHLtqsd7mFVAyt0dKz7zzmFA6VeEWOM2xNTuEX
	IphjGCbBWBceD0o1U1xnoE84VMXbICjraAjuik4V1rqwggUsQ7blyw5LKS40x5x6wEwAfFnOHq+
	GxTtI1zNSCEIp9Bg8hY9w7xh9HufvsFI0qLfGqU1hgIUZ/UW/M
X-Received: by 2002:a05:690e:4814:b0:677:c8f6:8d6b with SMTP id
 956f58d0204a3-67d89683233mt2717468d50.50.1794678079442; Sat, 14 Nov 2026
 09:41:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028131939.1014720-2-thnkslprpt@gmail.com> <20261105-igloo-stunt-534496ad0518@spud>
In-Reply-To: <20261105-igloo-stunt-534496ad0518@spud>
From: Avi <thnkslprpt@gmail.com>
Date: Sat, 14 Nov 2026 19:40:42 +0200
X-Gm-Features: AclHuK8MWDmPC5MuRXOth2gQ08oHB2Ef627AwfQrAm9fEzCcDU6F2vk2-TUYAHc
Message-ID: <CA+jvY9Ft4KKTGD7jM-pBFeN4orRuMs1pQUfcLerKGTW24KDQVQ@mail.gmail.com>
Subject: Re: [PATCH] cache: sifive_ccache: skip disabled device tree nodes
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_094121_122899_C642C1EB 
X-CRM114-Status: GOOD (  20.23  )
X-Spam-Score: 0.4 (/)
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
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SXQncyBtb3JlIG9mIGEgZGVmZW5zaXZlIHRoaW5nLiBUaGUgMiBjY2FjaGUgaW5zdGFuY2Ugd2Fz
IGFuIGV4YW1wbGUgLQp0aGUgaXNzdWUgaXMgYWxzbyByZWxldmFudCBmb3Igb25lIGRpc2FibGVk
IGNjYWNoZSBub2RlIG5vPwpTaW5jZSBvZl9maW5kX21hdGNoaW5nX25vZGVfYW5kX21hdGNoKCkg
ZG9lc24ndCBjaGVjayB3aGV0aGVyIGEgbm9kZQppcyBlbmFibGVkLCBpdCBjYW4gcmV0dXJuIGEg
ZGlzYWJsZWQgb25lLgoKc2lmaXZlX2NjYWNoZV9pbml0KCkgdGhlbiBnb2VzIGFoZWFkIGFuZCBt
YXBzIGFuZCBhY2Nlc3NlcyBpdHMKcmVnaXN0ZXJzLCBldmVuIHRob3VnaCB0aGUgZGV2aWNlIHRy
ZWUgbWFya3MgaXQgYXMgZGlzYWJsZWQgYW5kIG5vcm1hbApPRiBwbGF0Zm9ybS1kZXZpY2UgY3Jl
YXRpb24gd291bGQgc2tpcCBpdC4KCk9uIFRodSwgTm92IDUsIDIwMjYgYXQgODoyNOKAr1BNIENv
bm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAyOCwg
MjAyNiBhdCAwMzoxOTo0MFBNICswMjAwLCBBdmkgV2Vpc3Mgd3JvdGU6Cj4gPiBzaWZpdmVfY2Nh
Y2hlX2luaXQoKSB1c2VzIG9mX2ZpbmRfbWF0Y2hpbmdfbm9kZV9hbmRfbWF0Y2goKSwgd2hpY2gg
YWxzbwo+ID4gcmV0dXJucyBub2RlcyBtYXJrZWQgYXMgZGlzYWJsZWQuIFRoZSBpbml0aWFsaXpl
ciBjYW4gdGhlcmVmb3JlIG1hcCBhbmQKPiA+IGFjY2VzcyBhIGNhY2hlIGNvbnRyb2xsZXIgdGhh
dCB0aGUgZGV2aWNlIHRyZWUgbWFya3MgdW5hdmFpbGFibGUuCj4gPgo+ID4gU2VsZWN0IHRoZSBm
aXJzdCBhdmFpbGFibGUgbWF0Y2hpbmcgbm9kZSBiZWZvcmUgYWNjZXNzaW5nIGl0cyByZWdpc3Rl
cnMuCj4gPiBUaGlzIGFsc28gaGFuZGxlcyBhIGRpc2FibGVkIG5vZGUgcHJlY2VkaW5nIGFuIGVu
YWJsZWQgb25lLgo+ID4KPiA+IEZpeGVzOiBhOTY3YTI4OWYxNjkgKCJSSVNDLVY6IHNpZml2ZV9s
Ml9jYWNoZTogQWRkIEwyIGNhY2hlIGNvbnRyb2xsZXIgZHJpdmVyIGZvciBTaUZpdmUgU29DcyIp
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBdmkgV2Vpc3MgPHRobmtzbHBycHRAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgZHJpdmVycy9jYWNoZS9zaWZpdmVfY2NhY2hlLmMgfCA0ICsrKy0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY2FjaGUvc2lmaXZlX2NjYWNoZS5jIGIvZHJpdmVycy9jYWNoZS9zaWZp
dmVfY2NhY2hlLmMKPiA+IGluZGV4IDcxZDNmOTQ5ODdmYS4uMDI4NzhkNTQzODFkIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9jYWNoZS9zaWZpdmVfY2NhY2hlLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Y2FjaGUvc2lmaXZlX2NjYWNoZS5jCj4gPiBAQCAtMjk3LDcgKzI5Nyw5IEBAIHN0YXRpYyBpbnQg
X19pbml0IHNpZml2ZV9jY2FjaGVfaW5pdCh2b2lkKQo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBx
dWlya3MgX19tYXliZV91bnVzZWQ7Cj4gPiAgICAgICBpbnQgcmM7Cj4gPgo+ID4gLSAgICAgbnAg
PSBvZl9maW5kX21hdGNoaW5nX25vZGVfYW5kX21hdGNoKE5VTEwsIHNpZml2ZV9jY2FjaGVfaWRz
LCAmbWF0Y2gpOwo+ID4gKyAgICAgZm9yX2VhY2hfbWF0Y2hpbmdfbm9kZV9hbmRfbWF0Y2gobnAs
IHNpZml2ZV9jY2FjaGVfaWRzLCAmbWF0Y2gpCj4gPiArICAgICAgICAgICAgIGlmIChvZl9kZXZp
Y2VfaXNfYXZhaWxhYmxlKG5wKSkKPgo+IEFyZSB0aGVyZSBhbnkgZGV2aWNlcyB3aGVyZSB0aGlz
IGlzIGFjdHVhbGx5IHBvc3NpYmxlPyBJT1csIHdoZXJlIHRoZXJlCj4gYXJlIDIgY2NhY2hlIGlu
c3RhbmNlcy4KPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgaWYg
KCFucCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gPgo+ID4KPiA+IGJhc2Ut
Y29tbWl0OiA2NWJhOGYzNGVjODg2ZWM3MmIyYzA3ZGRjOGNmM2Q4MTVjMzI4NjlkCj4gPiAtLQo+
ID4gMi40My4wCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
