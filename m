Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE97FCD1284
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Mar 2024 16:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxTdscmk4kFBBJUyj5nXUFofJzY9K0kO2MlnqeuWFC8=; b=QA+fLtXbjVp+BW
	Mdo4kn63AyjVupyWGhLo3cVf8Xl5ssZt/44f19WnwKVmvKBOVUVvxhAK2KYXSJMWV+lgCJCPkj2X6
	VmYcQhZcjNIm/e3Ha/KYDtCPnjw9LPfIJxv+gdqrusP4ZZ8W8il5iBJtwAqTPH6VYF8bQ1MhXIvzl
	iS50WMzh5onhoNt/Cy4MG0GLcwfX+TviHDySh/oNwV1WbARBGjv934Jb7ATWmiPoVJ1ftMLodMs2a
	vToVm++EJRXQ4HNST02OPMkwGaL0NMy7oJUinz7oagwyKHQVV7rV5VlxzgigK3H9ge9+9kcqU9jmK
	dl6Cethxoxrz3sWu4BhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyFk-00000005nVY-1Myt;
	Sun, 31 Mar 2024 16:41:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyFe-00000005nRv-1J4B
	for linux-riscv@bombadil.infradead.org;
	Sun, 31 Mar 2024 16:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:List-Unsubscribe:List-Subscribe:List-Id:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description; bh=wjbwYCRip4YcjRzBPoCDglpAQisSR5Ok2zxLFR80raM=; b=HmQDG
	VxEOzItOMwPh28L9zW5BowUbV5lnPIZiDRGZE3ZO/ws/N2W7iZn8VZ7qQKxCxtXXiesgT9V6BOmU3
	+JRQ3VJyx0SFZZz0dB1q8VX6L62JdNUxs6dCm5rI189DrBGJzTwKrzNrVb94B/3NEehDTzu9x7XGf
	dpACp90q09IlJJuIJNFFUcyyDtvn7aUmfdTWW3jMaXzZTmc/uK/UXAwUqaiuGXwtEWZWOWCWotuGj
	qRvVn0PSmU20b0x5spjjljD5h6JySnZD9GpX1SsZyyLjQdcGOXjfEArDPL4/0XHFGBnlM12jivmaS
	FLKEfcRZtj9WIze+uXF7kVeJX+ZqA==;
Received: from a.mx.secunet.com ([62.96.220.36])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyFa-00000002dlU-3RNu
	for linux-riscv@lists.infradead.org;
	Sun, 31 Mar 2024 16:41:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id C3408208B2;
	Sun, 31 Mar 2024 18:41:30 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItlOSB6j9osf; Sun, 31 Mar 2024 18:41:29 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 56CF1208B7;
	Sun, 31 Mar 2024 18:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 56CF1208B7
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout2.secunet.com (Postfix) with ESMTP id 485C580005E;
	Sun, 31 Mar 2024 18:41:29 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:41:29 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:37:13 +0000
X-sender: <netdev+bounces-83574-peter.schumann=secunet.com@vger.kernel.org>
X-Receiver: <peter.schumann@secunet.com> ORCPT=rfc822;peter.schumann@secunet.com
X-CreatedBy: MSExchange15
X-HeloDomain: mbx-dresden-01.secunet.de
X-ExtendedProps: BQBjAAoA33YFfe5Q3AgFADcAAgAADwA8AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50Lk9yZ2FuaXphdGlvblNjb3BlEQAAAAAAAAAAAAAAAAAAAAAADwA/AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5EaXJlY3RvcnlEYXRhLk1haWxEZWxpdmVyeVByaW9yaXR5DwADAAAATG93
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 10.53.40.199
X-EndOfInjectedXHeaders: 14346
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=139.178.88.99; helo=sv.mirrors.kernel.org; envelope-from=netdev+bounces-83574-peter.schumann=secunet.com@vger.kernel.org; receiver=peter.schumann@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 3233C207D8
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711876971; cv=none; b=hv2V0jigilROcK8EYto6mRFG8DmuWtzxXZdqHtz9fMG0J+dkwO3J41ISZ+hTRcRxWrMDvtPfqrGiOO2Pa5vS9Hw9hNW0+rcY8I0q3N1C1xYo9KnGofkVAWYNtZ045WxaXdk92DZrHEodFCKU10wDs2vIdFY6zGSn/djqvoiqa+0=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711876971; c=relaxed/simple;
	bh=NU/seP21mtWkdilB97nH/1Auom8uGHKorbHfj6W3x1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t5VU4JM9HWfq6ydlfdq15M8AHsNevxb1HZ/WRW7e5KCGFbuynlYb35Qx1hbwhN8rTBK/vhMo3wMg6IQKk1cvjnlml0wLsB2fxmf42iOXZsYiZWVGRgHzQLCt/253/+2SOkeNOhmEUNNNocVPFZzGfHby5lZfh2NLhB8+aGYDVJ8=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
From: Pu Lehui <pulehui@huaweicloud.com>
To: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
	<pulehui@huaweicloud.com>
Subject: [PATCH bpf-next 1/2] riscv, bpf: Add 12-argument support for RV64 bpf trampoline
Date: Sun, 31 Mar 2024 09:24:04 +0000
Message-ID: <20240331092405.822571-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331092405.822571-1-pulehui@huaweicloud.com>
References: <20240331092405.822571-1-pulehui@huaweicloud.com>
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgCH2WtkKwlmesQWIw--.11467S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar15Jw13Kr1kAF13Cr45ZFb_yoWxJr4Dpa
	1DKrsxAFyvqa17Xa97WF1UXF1aya1qva43CFW7Gas3uFWYqr98GayFkF4jyry5GryrAw1f
	AFs0vF98KF17GrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSYLPUUUUU
	=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_174143_124620_6728CAED 
X-CRM114-Status: GOOD (  20.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Message-ID: <20240331092404.mKdMvEPt32w8uLevgN17prmG-qX3QlBIcLRIsSEDkWM@z>

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KClRoaXMgcGF0Y2ggYWRkcyAxMiBm
dW5jdGlvbiBhcmd1bWVudHMgc3VwcG9ydCBmb3IgcmlzY3Y2NCBicGYKdHJhbXBvbGluZS4gVGhl
IGN1cnJlbnQgYnBmIHRyYW1wb2xpbmUgc3VwcG9ydHMgPD0gc2l6ZW9mKHU2NCkgYnl0ZXMKc2Nh
bGFyIGFyZ3VtZW50cyBbMF0gYW5kIDw9IDE2IGJ5dGVzIHN0cnVjdCBhcmd1bWVudHMgWzFdLiBU
aGVyZWZvcmUsIHdlCmZvY3VzIG9uIHRoZSBzaXR1YXRpb24gd2hlcmUgc2NhbGFycyBhcmUgYXQg
bW9zdCBYTEVOIGJpdHMgYW5kCmFnZ3JlZ2F0ZXMgd2hvc2UgdG90YWwgc2l6ZSBkb2VzIG5vdCBl
eGNlZWQgMsOXWExFTiBiaXRzIGluIHRoZSByaXNjdgpjYWxsaW5nIGNvbnZlbnRpb24gWzJdLgoK
TGluazogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuOC9zb3VyY2Uva2VybmVs
L2JwZi9idGYuYyNMNjE4NCBbMF0KTGluazogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjYuOC9zb3VyY2Uva2VybmVsL2JwZi9idGYuYyNMNjc2OSBbMV0KTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtZWxmLXBzYWJpLWRvYy9yZWxlYXNlcy9kb3du
bG9hZC9kcmFmdC0yMDIzMDkyOS1lNWM4MDBlNjYxYTUzZWZlM2MyNjc4ZDcxYTMwNjMyM2I2MGVi
MTNiL3Jpc2N2LWFiaS5wZGYgWzJdClNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1
YXdlaS5jb20+Ci0tLQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDYzICsrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlv
bnMoKyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmluZGV4IDc3ZWEz
MDY0NTJkNC4uMmFlYzY5ZTRjMTE2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvbXA2NC5jCisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAgLTE0LDYg
KzE0LDcgQEAKICNpbmNsdWRlIDxhc20vY2ZpLmg+CiAjaW5jbHVkZSAiYnBmX2ppdC5oIgogCisj
ZGVmaW5lIFJWX01BWF9BUkdfUkVHUyA4CiAjZGVmaW5lIFJWX0ZFTlRSWV9OSU5TTlMgMgogCiAj
ZGVmaW5lIFJWX1JFR19UQ0MgUlZfUkVHX0E2CkBAIC02ODgsMjYgKzY4OSw0MyBAQCBpbnQgYnBm
X2FyY2hfdGV4dF9wb2tlKHZvaWQgKmlwLCBlbnVtIGJwZl90ZXh0X3Bva2VfdHlwZSBwb2tlX3R5
cGUsCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIHZvaWQgc3RvcmVfYXJncyhpbnQgbnJlZ3Ms
IGludCBhcmdzX29mZiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCitzdGF0aWMgdm9pZCBz
dG9yZV9hcmdzKGludCBucl9hcmdfc2xvdHMsIGludCBhcmdzX29mZiwgc3RydWN0IHJ2X2ppdF9j
b250ZXh0ICpjdHgpCiB7CiAJaW50IGk7CiAKLQlmb3IgKGkgPSAwOyBpIDwgbnJlZ3M7IGkrKykg
ewotCQllbWl0X3NkKFJWX1JFR19GUCwgLWFyZ3Nfb2ZmLCBSVl9SRUdfQTAgKyBpLCBjdHgpOwor
CWZvciAoaSA9IDA7IGkgPCBucl9hcmdfc2xvdHM7IGkrKykgeworCQlpZiAoaSA8IFJWX01BWF9B
UkdfUkVHUykgeworCQkJZW1pdF9zZChSVl9SRUdfRlAsIC1hcmdzX29mZiwgUlZfUkVHX0EwICsg
aSwgY3R4KTsKKwkJfSBlbHNlIHsKKwkJCWVtaXRfbGQoUlZfUkVHX1QxLCAxNiArIChpIC0gUlZf
TUFYX0FSR19SRUdTKSAqIDgsIFJWX1JFR19GUCwgY3R4KTsKKwkJCWVtaXRfc2QoUlZfUkVHX0ZQ
LCAtYXJnc19vZmYsIFJWX1JFR19UMSwgY3R4KTsKKwkJfQogCQlhcmdzX29mZiAtPSA4OwogCX0K
IH0KIAotc3RhdGljIHZvaWQgcmVzdG9yZV9hcmdzKGludCBucmVncywgaW50IGFyZ3Nfb2ZmLCBz
dHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKK3N0YXRpYyB2b2lkIHJlc3RvcmVfYXJncyhpbnQg
bnJfYXJnc19yZWcsIGludCBhcmdzX29mZiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiB7
CiAJaW50IGk7CiAKLQlmb3IgKGkgPSAwOyBpIDwgbnJlZ3M7IGkrKykgeworCWZvciAoaSA9IDA7
IGkgPCBucl9hcmdzX3JlZzsgaSsrKSB7CiAJCWVtaXRfbGQoUlZfUkVHX0EwICsgaSwgLWFyZ3Nf
b2ZmLCBSVl9SRUdfRlAsIGN0eCk7CiAJCWFyZ3Nfb2ZmIC09IDg7CiAJfQogfQogCitzdGF0aWMg
dm9pZCByZXN0b3JlX3N0YWNrX2FyZ3MoaW50IG5yX2FyZ3Nfc3RhY2ssIGludCBhcmdzX29mZiwg
aW50IHN0a19hcmdfb2ZmLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKK3sKKwlpbnQgaTsK
KworCWZvciAoaSA9IDA7IGkgPCBucl9hcmdzX3N0YWNrOyBpKyspIHsKKwkJZW1pdF9sZChSVl9S
RUdfVDEsIC0oYXJnc19vZmYgLSBSVl9NQVhfQVJHX1JFR1MgKiA4KSwgUlZfUkVHX0ZQLCBjdHgp
OworCQllbWl0X3NkKFJWX1JFR19GUCwgLXN0a19hcmdfb2ZmLCBSVl9SRUdfVDEsIGN0eCk7CisJ
CWFyZ3Nfb2ZmIC09IDg7CisJCXN0a19hcmdfb2ZmIC09IDg7CisJfQorfQorCiBzdGF0aWMgaW50
IGludm9rZV9icGZfcHJvZyhzdHJ1Y3QgYnBmX3RyYW1wX2xpbmsgKmwsIGludCBhcmdzX29mZiwg
aW50IHJldHZhbF9vZmYsCiAJCQkgICBpbnQgcnVuX2N0eF9vZmYsIGJvb2wgc2F2ZV9yZXQsIHN0
cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQogewpAQCAtNzgwLDggKzc5OCw4IEBAIHN0YXRpYyBp
bnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAq
aW0sCiB7CiAJaW50IGksIHJldCwgb2Zmc2V0OwogCWludCAqYnJhbmNoZXNfb2ZmID0gTlVMTDsK
LQlpbnQgc3RhY2tfc2l6ZSA9IDAsIG5yZWdzID0gbS0+bnJfYXJnczsKLQlpbnQgcmV0dmFsX29m
ZiwgYXJnc19vZmYsIG5yZWdzX29mZiwgaXBfb2ZmLCBydW5fY3R4X29mZiwgc3JlZ19vZmY7CisJ
aW50IHN0YWNrX3NpemUgPSAwLCBucl9hcmdfc2xvdHMgPSAwOworCWludCByZXR2YWxfb2ZmLCBh
cmdzX29mZiwgbnJlZ3Nfb2ZmLCBpcF9vZmYsIHJ1bl9jdHhfb2ZmLCBzcmVnX29mZiwgc3RrX2Fy
Z19vZmY7CiAJc3RydWN0IGJwZl90cmFtcF9saW5rcyAqZmVudHJ5ID0gJnRsaW5rc1tCUEZfVFJB
TVBfRkVOVFJZXTsKIAlzdHJ1Y3QgYnBmX3RyYW1wX2xpbmtzICpmZXhpdCA9ICZ0bGlua3NbQlBG
X1RSQU1QX0ZFWElUXTsKIAlzdHJ1Y3QgYnBmX3RyYW1wX2xpbmtzICpmbW9kX3JldCA9ICZ0bGlu
a3NbQlBGX1RSQU1QX01PRElGWV9SRVRVUk5dOwpAQCAtODI3LDIwICs4NDUsMjEgQEAgc3RhdGlj
IGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdl
ICppbSwKIAkgKiBGUCAtIHNyZWdfb2ZmICAgIFsgY2FsbGVlIHNhdmVkIHJlZwldCiAJICoKIAkg
KgkJICAgIFsgcGFkcyAgICAgICAgICAgICAgXSBwYWRzIGZvciAxNiBieXRlcyBhbGlnbm1lbnQK
KwkgKgorCSAqCQkgICAgWyBzdGFja19hcmdOICAgICAgICBdCisJICoJCSAgICBbIC4uLiAgICAg
ICAgICAgICAgIF0KKwkgKiBGUCAtIHN0a19hcmdfb2ZmIFsgc3RhY2tfYXJnMSAgICAgICAgXSBC
UEZfVFJBTVBfRl9DQUxMX09SSUcKIAkgKi8KIAogCWlmIChmbGFncyAmIChCUEZfVFJBTVBfRl9P
UklHX1NUQUNLIHwgQlBGX1RSQU1QX0ZfU0hBUkVfSVBNT0RJRlkpKQogCQlyZXR1cm4gLUVOT1RT
VVBQOwogCi0JLyogZXh0cmEgcmVnaXRlcnMgZm9yIHN0cnVjdCBhcmd1bWVudHMgKi8KLQlmb3Ig
KGkgPSAwOyBpIDwgbS0+bnJfYXJnczsgaSsrKQotCQlpZiAobS0+YXJnX2ZsYWdzW2ldICYgQlRG
X0ZNT0RFTF9TVFJVQ1RfQVJHKQotCQkJbnJlZ3MgKz0gcm91bmRfdXAobS0+YXJnX3NpemVbaV0s
IDgpIC8gOCAtIDE7Ci0KLQkvKiA4IGFyZ3VtZW50cyBwYXNzZWQgYnkgcmVnaXN0ZXJzICovCi0J
aWYgKG5yZWdzID4gOCkKKwlpZiAobS0+bnJfYXJncyA+IE1BWF9CUEZfRlVOQ19BUkdTKQogCQly
ZXR1cm4gLUVOT1RTVVBQOwogCisJZm9yIChpID0gMDsgaSA8IG0tPm5yX2FyZ3M7IGkrKykKKwkJ
bnJfYXJnX3Nsb3RzICs9IHJvdW5kX3VwKG0tPmFyZ19zaXplW2ldLCA4KSAvIDg7CisKIAkvKiBy
b29tIG9mIHRyYW1wb2xpbmUgZnJhbWUgdG8gc3RvcmUgcmV0dXJuIGFkZHJlc3MgYW5kIGZyYW1l
IHBvaW50ZXIgKi8KIAlzdGFja19zaXplICs9IDE2OwogCkBAIC04NTAsNyArODY5LDcgQEAgc3Rh
dGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2lt
YWdlICppbSwKIAkJcmV0dmFsX29mZiA9IHN0YWNrX3NpemU7CiAJfQogCi0Jc3RhY2tfc2l6ZSAr
PSBucmVncyAqIDg7CisJc3RhY2tfc2l6ZSArPSBucl9hcmdfc2xvdHMgKiA4OwogCWFyZ3Nfb2Zm
ID0gc3RhY2tfc2l6ZTsKIAogCXN0YWNrX3NpemUgKz0gODsKQEAgLTg2Nyw4ICs4ODYsMTMgQEAg
c3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1w
X2ltYWdlICppbSwKIAlzdGFja19zaXplICs9IDg7CiAJc3JlZ19vZmYgPSBzdGFja19zaXplOwog
CisJaWYgKG5yX2FyZ19zbG90cyAtIFJWX01BWF9BUkdfUkVHUyA+IDApCisJCXN0YWNrX3NpemUg
Kz0gKG5yX2FyZ19zbG90cyAtIFJWX01BWF9BUkdfUkVHUykgKiA4OworCiAJc3RhY2tfc2l6ZSA9
IHJvdW5kX3VwKHN0YWNrX3NpemUsIDE2KTsKIAorCXN0a19hcmdfb2ZmID0gc3RhY2tfc2l6ZTsK
KwogCWlmICghaXNfc3RydWN0X29wcykgewogCQkvKiBGb3IgdGhlIHRyYW1wb2xpbmUgY2FsbGVk
IGZyb20gZnVuY3Rpb24gZW50cnksCiAJCSAqIHRoZSBmcmFtZSBvZiB0cmFjZWQgZnVuY3Rpb24g
YW5kIHRoZSBmcmFtZSBvZgpAQCAtOTA0LDEwICs5MjgsMTAgQEAgc3RhdGljIGludCBfX2FyY2hf
cHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICppbSwKIAkJZW1p
dF9zZChSVl9SRUdfRlAsIC1pcF9vZmYsIFJWX1JFR19UMSwgY3R4KTsKIAl9CiAKLQllbWl0X2xp
KFJWX1JFR19UMSwgbnJlZ3MsIGN0eCk7CisJZW1pdF9saShSVl9SRUdfVDEsIG5yX2FyZ19zbG90
cywgY3R4KTsKIAllbWl0X3NkKFJWX1JFR19GUCwgLW5yZWdzX29mZiwgUlZfUkVHX1QxLCBjdHgp
OwogCi0Jc3RvcmVfYXJncyhucmVncywgYXJnc19vZmYsIGN0eCk7CisJc3RvcmVfYXJncyhucl9h
cmdfc2xvdHMsIGFyZ3Nfb2ZmLCBjdHgpOwogCiAJLyogc2tpcCB0byBhY3R1YWwgYm9keSBvZiB0
cmFjZWQgZnVuY3Rpb24gKi8KIAlpZiAoZmxhZ3MgJiBCUEZfVFJBTVBfRl9TS0lQX0ZSQU1FKQpA
QCAtOTQ3LDcgKzk3MSw4IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xp
bmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJfQogCiAJaWYgKGZsYWdzICYgQlBGX1RS
QU1QX0ZfQ0FMTF9PUklHKSB7Ci0JCXJlc3RvcmVfYXJncyhucmVncywgYXJnc19vZmYsIGN0eCk7
CisJCXJlc3RvcmVfYXJncyhtaW5fdChpbnQsIG5yX2FyZ19zbG90cywgUlZfTUFYX0FSR19SRUdT
KSwgYXJnc19vZmYsIGN0eCk7CisJCXJlc3RvcmVfc3RhY2tfYXJncyhucl9hcmdfc2xvdHMgLSBS
Vl9NQVhfQVJHX1JFR1MsIGFyZ3Nfb2ZmLCBzdGtfYXJnX29mZiwgY3R4KTsKIAkJcmV0ID0gZW1p
dF9jYWxsKChjb25zdCB1NjQpb3JpZ19jYWxsLCB0cnVlLCBjdHgpOwogCQlpZiAocmV0KQogCQkJ
Z290byBvdXQ7CkBAIC05ODIsNyArMTAwNyw3IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVf
YnBmX3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJfQogCiAJaWYgKGZs
YWdzICYgQlBGX1RSQU1QX0ZfUkVTVE9SRV9SRUdTKQotCQlyZXN0b3JlX2FyZ3MobnJlZ3MsIGFy
Z3Nfb2ZmLCBjdHgpOworCQlyZXN0b3JlX2FyZ3MobWluX3QoaW50LCBucl9hcmdfc2xvdHMsIFJW
X01BWF9BUkdfUkVHUyksIGFyZ3Nfb2ZmLCBjdHgpOwogCiAJaWYgKHNhdmVfcmV0KSB7CiAJCWVt
aXRfbGQoUlZfUkVHX0EwLCAtcmV0dmFsX29mZiwgUlZfUkVHX0ZQLCBjdHgpOwotLSAKMi4zNC4x
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
